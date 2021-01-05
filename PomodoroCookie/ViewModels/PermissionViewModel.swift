//
//  PermissionViewModel.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/05.
//

import EventKit
import Foundation
import os

class PermissionViewModel: ObservableObject {
    @Published var granted = false

    private let store: EKEventStore

    init() {
        store = EKEventStore()
    }

    func request() {
        store.requestAccess(to: .event) { granted, _ in
            if granted {
                os_log("calendar access granted", type: .debug)
                DispatchQueue.main.async {
                    self.granted = true
                }
            } else {
                os_log("user doesn't want to share calendar", type: .debug)
            }
        }
    }
}
