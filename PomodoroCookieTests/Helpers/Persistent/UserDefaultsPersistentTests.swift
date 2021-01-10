//
//  UserDefaultsPersistentTests.swift
//  PomodoroCookieTests
//
//  Created by 성준영 on 2020/12/31.
//

@testable import PomodoroCookie
import XCTest

class UserDefaultsPersistentTests: XCTestCase {
    func testSetKeySuccess() throws {
        let userDefaultsPersistent = UserDefaultsPersistent()
        let testKey = "testKey"

        userDefaultsPersistent.set(true, forKey: testKey)
        do {
            let value = try userDefaultsPersistent.getBool(forKey: testKey)
            XCTAssertTrue(value)
        } catch CookieError.NotExists(target: testKey) {
            XCTFail("get bool must not be failed")
        }
    }

    func testSetKeyNotExists() {
        let userDefaultsPersistent = UserDefaultsPersistent()
        let testNotExistsKey = "notExists"

        do {
            _ = try userDefaultsPersistent.getBool(forKey: testNotExistsKey)
            XCTFail("value must not be specified")
        } catch {}
    }
}
