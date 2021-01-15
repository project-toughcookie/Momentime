//
// Created by 성준영 on 2020/12/31.
//

import Combine
import Foundation

var PREFIX = "momentime."

class UserDefaultsPersistent: Persistent {
    private let userDefault = UserDefaults.standard

    public func set(_ value: Any?, forKey key: String) {
        userDefault.setValue(value, forKey: "\(PREFIX)\(key)")
    }

    public func getBool(forKey key: String) throws -> Bool {
        if !isKeyExists(key) {
            throw CookieError.NotExists(target: "\(PREFIX)\(key)")
        }

        return userDefault.bool(forKey: "\(PREFIX)\(key)")
    }

    public func getString(forKey key: String) throws -> String {
        if !isKeyExists(key) {
            throw CookieError.NotExists(target: "\(PREFIX)\(key)")
        }

        return userDefault.string(forKey: "\(PREFIX)\(key)")!
    }

    private func isKeyExists(_ key: String) -> Bool {
        userDefault.object(forKey: "\(PREFIX)\(key)") != nil
    }
}
