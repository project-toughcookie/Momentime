//
// Created by 성준영 on 2021/01/10.
//

@testable import Momentime
import XCTest

class CalendarViewModelTests: XCTestCase {
    func testRequestAccess() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let calendarViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        calendarViewModel.requestAccess()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(calendarViewModel.granted)
        }
    }

    func testSync() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let calendarViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        do {
            try calendarViewModel.sync()
        } catch {
            XCTFail("error must not be occured")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(2, calendarViewModel.todayTasks.count)
        }
    }

    func testFetchCalendars() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let calendarViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        calendarViewModel.fetchCalendars()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(1, calendarViewModel.calendars.count)
        }
    }

    func testFetchTodayTasks() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let calendarViewModel = TaskViewModel(calendarManager: calendarManager, settingManager: settingManager)
        do {
            try calendarViewModel.fetchTodayTasks(calendarId: "")
        } catch {
            XCTFail("error must not be occured")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(2, calendarViewModel.todayTasks.count)
        }
    }
}
