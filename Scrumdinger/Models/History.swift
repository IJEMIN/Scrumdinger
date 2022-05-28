//
//  History.swift
//  Scrumdinger
//
//  Created by Jemin Lee on 5/28/22.
//

import Foundation

struct History : Identifiable {
    let id : UUID
    let date : Date
    var attendees : [DailyScrum.Attendee]
    var lengthInMinutes : Int
}
