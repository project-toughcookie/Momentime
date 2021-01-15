//
// Created by 성준영 on 2021/01/10.
//

@testable import Momentime
import XCTest

class CalendarViewModelTests: XCTestCase {
    func testRequestAccess() {
        let calendarViewModel = CalendarViewModel(store: MockEventStore())
        calendarViewModel.requestAccess()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(calendarViewModel.granted)
        }
    }

    func testFetchCalendars() {
        let calendarViewModel = CalendarViewModel(store: MockEventStore())
        calendarViewModel.fetchCalendars()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(1, calendarViewModel.calendars.count)
        }
    }

    func testFetchTodayTasks() {
        let calendarViewModel = CalendarViewModel(store: MockEventStore())
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
