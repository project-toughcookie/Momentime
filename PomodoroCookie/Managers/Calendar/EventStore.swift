//
// Created by 성준영 on 2021/01/10.
//

import EventKit
import Foundation

protocol EventStore {
    func eventAuthorizationStatus() -> EKAuthorizationStatus
    func requestEventAccess(handler: @escaping (Bool, Error?) -> Void)
    func getEventCalendars() -> [EventCalendar]
}

extension EKEventStore: EventStore {
    func eventAuthorizationStatus() -> EKAuthorizationStatus {
        EKEventStore.authorizationStatus(for: .event)
    }

    func requestEventAccess(handler: @escaping (Bool, Error?) -> Void) {
        EKEventStore().requestAccess(to: EKEntityType.event, completion: handler)
    }

    func getEventCalendars() -> [EventCalendar] {
        let ekCalendars = EKEventStore().calendars(for: .event)
        return ekCalendars.map { (ekCalendar: EKCalendar) -> EventCalendar in
            EventCalendar(
                id: ekCalendar.calendarIdentifier,
                title: ekCalendar.title,
                color: ekCalendar.cgColor,
                type: ekCalendar.type,
                allowModification: ekCalendar.allowsContentModifications
            )
        }
    }
}

class MockEventStore: EventStore {
    func eventAuthorizationStatus() -> EKAuthorizationStatus {
        .authorized
    }

    func requestEventAccess(handler: @escaping (Bool, Error?) -> Void) {
        handler(true, nil)
    }

    func getEventCalendars() -> [EventCalendar] {
        let calendars: [EventCalendar] = [
            EventCalendar(id: "1", title: "mock calendar 1", color: CGColor.white, type: .local, allowModification: true),
            EventCalendar(id: "2", title: "mock calendar 2", color: CGColor.black, type: .local, allowModification: false),
            EventCalendar(id: "2", title: "mock calendar 2", color: CGColor.clear, type: .birthday, allowModification: false),
        ]
        return calendars
    }
}
