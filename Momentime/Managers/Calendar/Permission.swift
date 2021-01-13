//
// Created by 성준영 on 2021/01/13.
//

import EventKit
import Foundation

class Permission {
    private let store: EventStore

    init(store: EventStore = EKEventStore()) {
        self.store = store
    }

    func request(handler: @escaping (Bool, Error?) -> Void) {
        store.requestAccess(handler: handler)
    }
}
