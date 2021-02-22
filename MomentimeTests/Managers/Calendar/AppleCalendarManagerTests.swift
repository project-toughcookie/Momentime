//
// Created by 성준영 on 2021/01/10.
//

@testable import Momentime
import XCTest

class AppleCalendarManagerTests: XCTestCase {
    func testGetCalendarsShouldSucceed() {
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let calendars = calendarManager.getCalendars()
        XCTAssertEqual(2, calendars.count)
    }

    func testGetTodayTasksShouldSucceed() {
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        do {
            let tasks = try calendarManager.getTodayTasks(calendarId: "")
            XCTAssertEqual(2, tasks.count)
        } catch {
            XCTFail("error must not be occurred")
        }
    }

    func testToggleTaskDone() {
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        do {
            try calendarManager.toggleTaskDone(taskId: "1")
        } catch {
            XCTFail("error must not be occurred")
        }
    }
}
