//
// Created by 성준영 on 2021/01/13.
//

@testable import Momentime
import XCTest

class DateHelperTests: XCTestCase {
    func testDateConvert() {
        do {
            _ = try DateHelper.date(year: 2020, month: 1, day: 23)
        } catch {
            XCTFail("error must not be occurred")
        }

        do {
            _ = try DateHelper.date(year: 2020, month: 2020, day: 23)
            XCTFail("error must be occurred")
        } catch {}
    }

    func testHourAfterConvert() {
        do {
            let before = try DateHelper.date(year: 2020, month: 1, day: 23)
            let after = try DateHelper.hourAfter(hour: 1, from: before)
            let current = Calendar.current
            XCTAssertEqual(current.component(.hour, from: after), 1)
        } catch {
            XCTFail("error must be not occurred")
        }
    }
}
