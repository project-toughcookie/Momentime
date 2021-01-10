//
// Created by 성준영 on 2021/01/10.
//

@testable import PomodoroCookie
import XCTest

class CalendarManagerTests: XCTestCase {
    func testRequestAccess() {
        let calendarManager = CalendarManager(store: MockEventStore())
        calendarManager.requestAccess { granted, _ in
            XCTAssertTrue(granted)
        }
    }

    func testIsAuthorized() {
        let calendarManager = CalendarManager(store: MockEventStore())
        let authorized = calendarManager.isAuthorized()
        XCTAssertTrue(authorized)
    }

    func testGetEventCalendars() {
        let calendarManager = CalendarManager(store: MockEventStore())
        let calendars = calendarManager.getEventCalendars()
        XCTAssertEqual(1, calendars.count)
    }
}
