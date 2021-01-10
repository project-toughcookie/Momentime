//
//  Calendar.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/04.
//

import EventKit
import Foundation

class CalendarManager {
    private let store: EventStore

    init(store: EventStore = EKEventStore()) {
        self.store = store
    }

    func requestAccess(handler: @escaping (Bool, Error?) -> Void) {
        store.requestEventAccess(handler: handler)
    }

    func isAuthorized() -> Bool {
        let status = store.eventAuthorizationStatus()
        switch status {
        case .authorized:
            return true
        default:
            return false
        }
    }

    func getEventCalendars() -> [EventCalendar] {
        let calendars: [EventCalendar] = store.getEventCalendars()

        return calendars.filter { calendar in
            calendar.type != EKCalendarType.birthday &&
                calendar.type != EKCalendarType.subscription &&
                calendar.allowModification == true
        }
    }
}
