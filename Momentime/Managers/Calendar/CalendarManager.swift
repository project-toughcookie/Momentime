//
// Created by 성준영 on 2021/01/13.
//

import Foundation

protocol CalendarManager {
    func getCalendars() -> [TaskCalendar]
    func getTodayTasks(calendarId: String) throws -> [Task]
}
