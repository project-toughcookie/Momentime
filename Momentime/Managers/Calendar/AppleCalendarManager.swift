//
//  Calendar.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/04.
//

import EventKit
import Foundation

class AppleCalendarManager: CalendarManager {
    private let store: EventStore

    init(store: EventStore = EKEventStore()) {
        self.store = store
    }

    func getStore() -> EventStore {
        store
    }

    func getCalendars() -> [TaskCalendar] {
        let calendars: [TaskCalendar] = store.getCalendars()

        return calendars.filter { calendar in
            calendar.type != EKCalendarType.birthday &&
                calendar.type != EKCalendarType.subscription &&
                calendar.allowModification == true
        }
    }

    func getTodayTasks(calendarId: String) throws -> [Task] {
        try store.getTodayTasks(calendarId: calendarId)
    }
}
