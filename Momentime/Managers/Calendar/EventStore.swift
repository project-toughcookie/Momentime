//
// Created by 성준영 on 2021/01/10.
//

import EventKit
import Foundation

protocol EventStore {
    func eventAuthorizationStatus() -> EKAuthorizationStatus
    func requestAccess(handler: @escaping (Bool, Error?) -> Void)
    func getCalendars() -> [TaskCalendar]
    func getTodayTasks(calendarId: String) throws -> [Task]
}

extension EKEventStore: EventStore {
    func eventAuthorizationStatus() -> EKAuthorizationStatus {
        EKEventStore.authorizationStatus(for: .event)
    }

    func requestAccess(handler: @escaping (Bool, Error?) -> Void) {
        EKEventStore().requestAccess(to: EKEntityType.event, completion: handler)
    }

    func getCalendars() -> [TaskCalendar] {
        let ekCalendars = EKEventStore().calendars(for: .event)
        return ekCalendars.map { (ekCalendar: EKCalendar) -> TaskCalendar in
            TaskCalendar(
                id: ekCalendar.calendarIdentifier,
                title: ekCalendar.title,
                color: ekCalendar.cgColor,
                type: ekCalendar.type,
                allowModification: ekCalendar.allowsContentModifications
            )
        }
    }

    func getTodayTasks(calendarId: String) throws -> [Task] {
        let store = EKEventStore()

        let current = Calendar.current
        let now = Date()
        let start: Date
        let end: Date
        do {
            start = try DateHelper.date(
                year: current.component(.year, from: now),
                month: current.component(.month, from: now),
                day: current.component(.day, from: now)
            )
            end = try DateHelper.hourAfter(hour: 24, from: start)
        } catch {
            throw error
        }

        let calendar = store.calendar(withIdentifier: calendarId)
        let predicate = store.predicateForEvents(withStart: start, end: end, calendars: [calendar!])

        let ekEvents = store.events(matching: predicate)
        return ekEvents.map { (ekEvent: EKEvent) -> Task in
            Task(
                id: ekEvent.eventIdentifier,
                title: ekEvent.title,
                isAllDay: ekEvent.isAllDay,
                start: ekEvent.startDate,
                end: ekEvent.endDate,
                notes: ekEvent.notes
            )
        }
    }
}

class MockEventStore: EventStore {
    func eventAuthorizationStatus() -> EKAuthorizationStatus {
        .authorized
    }

    func requestAccess(handler: @escaping (Bool, Error?) -> Void) {
        handler(true, nil)
    }

    func getCalendars() -> [TaskCalendar] {
        let calendars: [TaskCalendar] = [
            TaskCalendar(id: "1", title: "mock calendar 1", color: CGColor.white, type: .local, allowModification: true),
            TaskCalendar(id: "2", title: "mock calendar 2", color: CGColor.black, type: .local, allowModification: false),
            TaskCalendar(id: "3", title: "mock calendar 2", color: CGColor.clear, type: .birthday, allowModification: false),
        ]
        return calendars
    }

    func getTodayTasks(calendarId _: String) throws -> [Task] {
        let start: Date
        let end: Date
        do {
            start = try DateHelper.date(year: 2020, month: 1, day: 1)
            end = try DateHelper.date(year: 2020, month: 1, day: 2)
        } catch {
            throw error
        }

        let tasks: [Task] = [
            Task(id: "1", title: "mock task 1", isAllDay: false, start: start, end: end, notes: ""),
            Task(id: "2", title: "mock task 2", isAllDay: false, start: start, end: end, notes: ""),
        ]
        return tasks
    }
}
