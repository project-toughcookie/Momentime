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
        let intTestKey = "intTestKey"
        let intTestValue = "intTestValue"

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

        userDefaultsPersistent.set(intTestValue, forKey: intTestKey)
        do {
            let value = try userDefaultsPersistent.getString(forKey: intTestKey)
            XCTAssertEqual(value, intTestValue)
        } catch CookieError.NotExists(target: intTestKey) {
            XCTFail("get int must not be failed")
        }
    }

    func testSetKeyNotExists() {
        let userDefaultsPersistent = UserDefaultsPersistent()
        let testKey = "notExists"

        do {
            _ = try userDefaultsPersistent.getBool(forKey: testKey)
            XCTFail("value must not be specified")
        } catch {}

        do {
            _ = try userDefaultsPersistent.getString(forKey: testKey)
            XCTFail("value must not be specified")
        } catch {}

        do {
            _ = try userDefaultsPersistent.getInt(forKey: testKey)
            XCTFail("value must not be specified")
        } catch {}
    }
}
