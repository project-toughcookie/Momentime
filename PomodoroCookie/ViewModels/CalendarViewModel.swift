//
//  PermissionViewModel.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/05.
//

import EventKit
import Foundation
import os

class CalendarViewModel: ObservableObject {
    private let calendarManager: CalendarManager

    @Published var granted = false
    @Published var calendars: [EventCalendar] = []

    init(store: EventStore = EKEventStore()) {
        calendarManager = CalendarManager(store: store)
    }

    func requestAccess() {
        calendarManager.requestAccess { granted, _ in
            if granted {
                os_log("calendar access granted", type: .debug)
                DispatchQueue.main.async {
                    self.granted = true
                }
            } else {
                os_log("user doesn't want to share calendar", type: .debug)
            }
        }
    }

    func fetchCalendars() {
        calendars = calendarManager.getEventCalendars()
    }
}
