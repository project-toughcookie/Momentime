//
//  AppleCalendar.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/04.
//

import EventKit
import Foundation

class AppleCalendarManager: CalendarManager {
    private let store: EKEventStore

    init() throws {
        store = EKEventStore()
        if isGranted() {
            throw CookieError.UnAuthorized
        }
    }

    private func isGranted() -> Bool {
        let status = EKEventStore.authorizationStatus(for: .event)
        switch status {
        case .authorized:
            return true
        default:
            return false
        }
    }

    func getCalendars() -> [Calendar] {
        let ekCalendars: [EKCalendar] = store.calendars(for: .event)
        let calendars = ekCalendars.map { (ekCalendar: EKCalendar) -> Calendar in
            Calendar(id: ekCalendar.calendarIdentifier,
                     title: ekCalendar.title,
                     color: ekCalendar.cgColor,
                     allowModification: ekCalendar.allowsContentModifications)
        }
        return calendars
    }
}
