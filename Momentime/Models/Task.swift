//
//  Task.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/04.
//

import Foundation

struct Task: Codable, Identifiable {
    let id: String
    let title: String
    let isAllDay: Bool
    let start: Date
    let end: Date
    let done: Bool
    let workInProgress: Bool

    init(id: String, title: String, isAllDay: Bool, start: Date, end: Date, notes: String?) {
        let now = Date()

        self.id = id
        self.title = title
        self.isAllDay = isAllDay
        self.start = start
        self.end = end
        done = notes != nil ? notes!.contains("[\("Done".localized)]") : false
        workInProgress = start < now && end > now ? true : false
    }
}
