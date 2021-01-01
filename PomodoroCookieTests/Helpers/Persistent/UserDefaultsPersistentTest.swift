//
//  UserDefaultsPersistentTest.swift
//  PomodoroCookieTests
//
//  Created by 성준영 on 2020/12/31.
//

@testable import PomodoroCookie
import XCTest

class UserDefaultsPersistentTests: XCTestCase {
    private let userDefaultsPersistent = UserDefaultsPersistent()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetKeySuccess() throws {
        let testKey = "testKey"

        userDefaultsPersistent.set(true, forKey: testKey)
        let value = try userDefaultsPersistent.getObject(forKey: testKey) as! Bool

        XCTAssertTrue(value)
    }

    func testSetKeyNotExists() {
        let testNotExistsKey = "notExists"

        do {
            _ = try userDefaultsPersistent.getObject(forKey: testNotExistsKey) as! Bool
            XCTFail("value must be not exists")
        } catch {}
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
