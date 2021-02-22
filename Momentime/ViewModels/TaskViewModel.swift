//
//  PermissionViewModel.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/05.
//

import Combine
import EventKit
import Foundation
import os

class TaskViewModel: ObservableObject {
    @Published var granted = false
    @Published var calendars: [TaskCalendar] = []
    @Published var todayTasks: [Task] = []
    @Published var todayDoneTasks: [Task] = []

    private let calendarManager: CalendarManager
    private let settingManager: SettingManager
    private let permission: Permission
    private var cancellable = Set<AnyCancellable>()

    init(calendarManager: CalendarManager = AppleCalendarManager(), settingManager: SettingManager = SettingManager()) {
        self.calendarManager = calendarManager
        self.settingManager = settingManager
        permission = Permission(store: calendarManager.getStore())
    }

    func requestAccess() {
        permission.request { granted, _ in
            if granted {
                os_log("calendar access granted", type: .debug)
                DispatchQueue.main.async {
                    self.granted = true
                    self.subscribeEvents()
                }
            } else {
                os_log("user doesn't want to share calendar", type: .debug)
            }
        }
    }

    func subscribeEvents() {
        NotificationCenter.default.publisher(for: .EKEventStoreChanged).sink { _ in
            DispatchQueue.main.async {
                do {
                    try self.sync()
                } catch {
                    print(error) // TODO: error published 변수 추가
                }
            }
        }.store(in: &cancellable)
    }

    func sync() throws {
        fetchCalendars()
        if modelData.svm.defaultCalendar != "" {
            try fetchTodayTasks(calendarId: settingManager.defaultCalendar)
            return
        }

        if calendars.count != 0 {
            try fetchTodayTasks(calendarId: calendars[0].id)
            return
        }

        todayTasks = []
    }

    func fetchCalendars() {
        calendars = calendarManager.getCalendars()
    }

    func fetchTodayTasks(calendarId: String) throws {
        todayTasks = try calendarManager.getTodayTasks(calendarId: calendarId)
        todayDoneTasks = todayTasks.filter { task in
            task.done
        }
    }

    func getDefaultCalendar() -> String {
        for calendar in calendars {
            if settingManager.defaultCalendar == calendar.id {
                return calendar.title
            }
        }
        return "???"
    }

    func toggleTaskDone(taskId: String) throws {
        do {
            try calendarManager.toggleTaskDone(taskId: taskId)
        } catch {
            print("failed") // TODO: 예외 처리
        }
    }
}
