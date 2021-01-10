//
// Created by 성준영 on 2020/12/31.
//

import Combine
import Foundation

var INITIALIZED = "initialized"

class UserDefaultsPersistent: Persistent {
    private let userDefault = UserDefaults.standard

    public func set(_ value: Any?, forKey key: String) {
        userDefault.setValue(value, forKey: key)
    }

    public func getBool(forKey key: String) throws -> Bool {
        if !isKeyExists(key) {
            throw CookieError.NotExists(target: key)
        }

        return userDefault.bool(forKey: key)
    }

    private func isKeyExists(_ key: String) -> Bool {
        userDefault.object(forKey: key) != nil
    }
}
