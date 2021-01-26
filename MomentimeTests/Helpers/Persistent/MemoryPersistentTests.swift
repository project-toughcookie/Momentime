//
// Created by 성준영 on 2021/01/05.
//

@testable import Momentime
import XCTest

class MemoryPersistentTests: XCTestCase {
    func testSetKeyAndGetSuccess() throws {
        let memoryPersistent = MemoryPersistent()
        let boolTestKey = "boolTestKey"
        let stringTestKey = "stringTestKey"
        let stringTestValue = "stringTestValue"
        let intTestKey = "intTestKey"
        let intTestValue = "intTestValue"

        memoryPersistent.set(true, forKey: boolTestKey)
        do {
            let value = try memoryPersistent.getBool(forKey: boolTestKey)
            XCTAssertTrue(value)
        } catch CookieError.NotExists(target: stringTestKey) {
            XCTFail("get bool must not be failed")
        }

        memoryPersistent.set(stringTestValue, forKey: stringTestKey)
        do {
            let value = try memoryPersistent.getString(forKey: stringTestKey)
            XCTAssertEqual(value, stringTestValue)
        } catch CookieError.NotExists(target: stringTestKey) {
            XCTFail("get string must not be failed")
        }

        memoryPersistent.set(intTestValue, forKey: intTestKey)
        do {
            let value = try memoryPersistent.getString(forKey: intTestKey)
            XCTAssertEqual(value, intTestValue)
        } catch CookieError.NotExists(target: intTestKey) {
            XCTFail("get int must not be failed")
        }
    }

    func testGetNotExists() throws {
        let memoryPersistent = MemoryPersistent()
        let testKey = "notExists"

        do {
            _ = try memoryPersistent.getBool(forKey: testKey)
            XCTFail("value must not be specified")
        } catch {}

        do {
            _ = try memoryPersistent.getString(forKey: testKey)
            XCTFail("value must not be specified")
        } catch {}

        do {
            _ = try memoryPersistent.getInt(forKey: testKey)
            XCTFail("value must not be specified")
        } catch {}
    }
}
