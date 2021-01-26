//
// Created by 성준영 on 2021/01/18.
//

@testable import Momentime
import XCTest

class TestUtil: XCTestCase {
    func testResetUserDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
