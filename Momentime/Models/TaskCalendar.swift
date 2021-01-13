//
//  Calendar.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/04.
//

import EventKit
import Foundation

struct TaskCalendar {
    let id: String
    let title: String
    let color: CGColor
    let type: EKCalendarType
    let allowModification: Bool

    init(id: String, title: String, color: CGColor, type: EKCalendarType, allowModification: Bool) {
        self.id = id
        self.title = title
        self.color = color
        self.type = type
        self.allowModification = allowModification
    }
}
