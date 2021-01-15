//
//  UserDefaultsPersistentTests.swift
//  MomentimeTests
//
//  Created by 성준영 on 2020/12/31.
//

@testable import Momentime
import XCTest

class UserDefaultsPersistentTests: XCTestCase {
    func testSetKeySuccess() throws {
        let userDefaultsPersistent = UserDefaultsPersistent()
        let boolTestKey = "boolTestKey"
        let stringTestKey = "stringTestKey"
        let stringTestValue = "stringTestValue"

        userDefaultsPersistent.set(true, forKey: boolTestKey)
        do {
            let value = try userDefaultsPersistent.getBool(forKey: boolTestKey)
            XCTAssertTrue(value)
        } catch CookieError.NotExists(target: boolTestKey) {
            XCTFail("get bool must not be failed")
        }

        userDefaultsPersistent.set(stringTestValue, forKey: stringTestKey)
        do {
            let value = try userDefaultsPersistent.getString(forKey: stringTestKey)
            XCTAssertEqual(value, stringTestValue)
        } catch CookieError.NotExists(target: stringTestKey) {
            XCTFail("get string must not be failed")
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
