//
// Created by 성준영 on 2021/01/10.
//

@testable import Momentime
import XCTest

class TaskViewModelTests: XCTestCase {
    func testRequestAccess() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let taskViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        taskViewModel.requestAccess()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(taskViewModel.granted)
        }
    }

    func testSync() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let taskViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        do {
            try taskViewModel.sync()
        } catch {
            XCTFail("error must not be occured")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(2, taskViewModel.todayTasks.count)
        }
    }

    func testFetchCalendars() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let taskViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        taskViewModel.fetchCalendars()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(1, taskViewModel.calendars.count)
        }
    }

    func testFetchTodayTasks() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let taskViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        do {
            try taskViewModel.fetchTodayTasks(calendarId: "")
        } catch {
            XCTFail("error must not be occured")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(2, taskViewModel.todayTasks.count)
        }
    }

    func testGetDefaultCalendarShouldSucceed() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let taskViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)

        let result = taskViewModel.getDefaultCalendar()
        XCTAssertEqual(result, "???")
    }
}
