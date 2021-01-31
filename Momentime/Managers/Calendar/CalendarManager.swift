//
// Created by 성준영 on 2021/01/13.
//

import Foundation

protocol CalendarManager {
    func getStore() -> EventStore
    func getCalendars() -> [TaskCalendar]
    func getTodayTasks(calendarId: String) throws -> [Task]
    func toggleTaskDone(taskId: String) throws
}
