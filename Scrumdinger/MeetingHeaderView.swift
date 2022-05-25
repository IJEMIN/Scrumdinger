//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Jemin Lee on 5/25/22.
//

import SwiftUI

struct MeetingHeaderView: View {
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else {return 1}
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        
        ProgressView(value: progress)
            .progressViewStyle(ScrumProgressViewStyle(theme: theme))
        HStack {
            VStack(alignment: .leading) {
                Text("Seconds Elapsed")
                    .font(Font.caption)
                Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Seconds Remaining")
                    .font(.caption)
                Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .buttercup)
            .previewLayout(.sizeThatFits)
    }
}
