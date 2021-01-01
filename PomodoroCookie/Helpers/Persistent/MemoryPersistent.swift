//
// Created by 성준영 on 2021/01/01.
//

import Foundation

class MemoryPersistent: Persistent {
    static let shared = MemoryPersistent()

    private var data: [String: Any] = [:]

    func set(_ value: Any?, forKey key: String) {
        data.updateValue(value!, forKey: key)
    }

    func getObject(forKey key: String) throws -> Any {
        guard let value = data[key] else {
            throw CookieError.NotExists(target: key)
        }

        return value
    }
}
