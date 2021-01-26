//
//  MockEventStore.swift
//  MomentimeTests
//
//  Created by 성준영 on 2021/01/16.
//

import EventKit
import Foundation

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
            TaskCalendar(id: "2", title: "mock calendar 2", color: CGColor.white, type: .local, allowModification: true),
            TaskCalendar(id: "3", title: "mock calendar 3", color: CGColor.black, type: .local, allowModification: false),
            TaskCalendar(id: "4", title: "mock calendar 4", color: CGColor.clear, type: .birthday, allowModification: false),
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
            Task(id: "1", title: "mock task 1", isAllDay: false, start: start, end: end, notes: "[완료]"),
            Task(id: "2", title: "mock task 2", isAllDay: false, start: start, end: end, notes: "[Done]"),
        ]
        return tasks
    }
}
