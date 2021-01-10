//
// Created by 성준영 on 2021/01/10.
//

@testable import PomodoroCookie
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
}
