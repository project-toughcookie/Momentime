//
// Created by 성준영 on 2021/01/03.
//

@testable import PomodoroCookie
import XCTest

class I18NTests: XCTestCase {
    func testI18NLocalize() throws {
        let testStr = "Unit Test".localized

        XCTAssertEqual(testStr, "Unit Test")
    }
}
