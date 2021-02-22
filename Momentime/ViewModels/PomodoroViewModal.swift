//
// Created by 성준영 on 2021/01/16.
//

import Foundation
import SwiftUI

class PomodoroViewModal: ObservableObject {
    @Published var prevStatus: Status
    @Published var status: Status
    @Published var remainSeconds: Int
    @Published var remainRatio: CGFloat

    private let settingManager: SettingManager

    init(settingManager: SettingManager = SettingManager()) {
        self.settingManager = settingManager
        prevStatus = Status.stop
        status = Status.stop
        remainSeconds = settingManager.playSeconds
        remainRatio = 1
        startReconcile()
    }

    func setStatus(status: Status) {
        DispatchQueue.main.async {
            self.prevStatus = self.status
            self.status = status
        }
    }

    private func startReconcile() {
        DispatchQueue.global(qos: .background).async {
            while true {
                if self.remainSeconds == 0 {
                    switch self.status {
                    case .play:
                        DispatchQueue.main.async {
                            self.remainSeconds = self.settingManager.breakSeconds
                            self.status = .break
                        }
                    case .break:
                        DispatchQueue.main.async {
                            self.remainSeconds = self.settingManager.playSeconds
                            self.status = .play
                        }
                    default:
                        continue
                    }
                }

                switch self.status {
                case .play:
                    DispatchQueue.main.async {
                        self.remainRatio = CGFloat(self.remainSeconds) / CGFloat(self.settingManager.playSeconds)
                        self.remainSeconds -= 1
                    }
                case .pause:
                    continue
                case .stop:
                    DispatchQueue.main.async {
                        self.remainSeconds = self.settingManager.playSeconds
                        self.remainRatio = 1
                    }
                case .break:
                    DispatchQueue.main.async {
                        self.remainRatio = CGFloat(self.remainSeconds) / CGFloat(self.settingManager.breakSeconds)
                        self.remainSeconds -= 1
                    }
                }

                sleep(1)
            }
        }
    }
}
