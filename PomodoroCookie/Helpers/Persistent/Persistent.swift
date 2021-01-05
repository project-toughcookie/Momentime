//
// Created by 성준영 on 2020/12/31.
//

import Foundation

protocol Persistent {
    func set(_ value: Any?, forKey key: String)
    func getBool(forKey key: String) throws -> Bool
}
