//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Jemin Lee on 5/28/22.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted}) else {return nil}
        
        return index + 1;
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy{$0.isCompleted}
    }
    
    private var speakerText: String {
        // left speakerNumber is local variable
        // right speakerNumber is property
        guard let speakerNumber = speakerNumber else {
            return "No more speakers"
        }
        
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack{
            HStack {
                if isLastSpeaker
                {
                    Text("Last Speaker")
                }
                else
                {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
