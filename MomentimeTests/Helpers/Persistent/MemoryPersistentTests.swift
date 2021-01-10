//
// Created by 성준영 on 2021/01/05.
//

@testable import Momentime
import XCTest

class MemoryPersistentTests: XCTestCase {
    func testSetKeyAndGetSuccess() throws {
        let memoryPersistent = MemoryPersistent()
        let testKey = "testKey"

        memoryPersistent.set(true, forKey: testKey)

        do {
            let value = try memoryPersistent.getBool(forKey: testKey)
            XCTAssertTrue(value)
        } catch CookieError.NotExists(target: testKey) {
            XCTFail("get bool must not be failed")
        }
    }

    func testGetNotExists() throws {
        let memoryPersistent = MemoryPersistent()
        let testKey = "testKey"

        do {
            _ = try memoryPersistent.getBool(forKey: testKey)
            XCTFail("value must not be specified")
        } catch {}
    }
}
