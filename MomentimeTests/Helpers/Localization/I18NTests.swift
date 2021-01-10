//
// Created by 성준영 on 2021/01/03.
//

@testable import Momentime
import XCTest

class I18NTests: XCTestCase {
    func testI18NLocalize() throws {
        let testStr = "Unit Test".localized

        if NSLocale.current.languageCode == "ko" {
            XCTAssertEqual(testStr, "유닛 테스트")
        } else {
            XCTAssertEqual(testStr, "Unit Test")
        }
    }
}
