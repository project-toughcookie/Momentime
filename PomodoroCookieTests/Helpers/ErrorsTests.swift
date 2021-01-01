//
// Created by 성준영 on 2021/01/02.
//

@testable import PomodoroCookie
import XCTest

class ErrorsTests: XCTestCase {

    func testUnknownPrint() {
        let unknownError = CocoaError(CocoaError.coderInvalidValue)

        ErrorHandler.handle(error: unknownError)
    }

    func testNotExistsPrint() {
        let notExistsError = CookieError.NotExists(target: "test")

        ErrorHandler.handle(error: notExistsError)
    }
}
