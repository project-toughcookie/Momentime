//
// Created by 성준영 on 2021/01/10.
//

import EventKit
import Foundation

protocol EventStore {
    func requestAccess(handler: @escaping (Bool, Error?) -> Void)
    func getCalendars() -> [TaskCalendar]
    func getTodayTasks(calendarId: String) throws -> [Task]
    func toggleTaskDone(taskId: String) throws
}

extension EKEventStore: EventStore {
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

    func toggleTaskDone(taskId: String) throws {
        let store = EKEventStore()

        if let event = store.event(withIdentifier: taskId) {
            if event.notes == nil {
                event.notes = ""
            }

            if event.notes!.contains("[Done] ") {
                event.notes = event.notes?.replacingOccurrences(of: "[Done] ", with: "")
            } else {
                event.notes = "[Done] " + event.notes!
            }

            do {
                try store.save(event, span: EKSpan.thisEvent)
            } catch {
                throw CookieError.TaskUpdateFailed
            }
            return
        }

        throw CookieError.TaskUpdateFailed
    }
}
