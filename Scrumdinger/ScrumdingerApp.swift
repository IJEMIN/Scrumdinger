//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Jemin Lee on 5/14/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
