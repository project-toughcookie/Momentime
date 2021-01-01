//
// Created by 성준영 on 2020/12/31.
//

import Foundation

let SETTING = "setting"

final class SettingManager: ObservableObject {
    @Published var setting: Setting

    private let persistent: Persistent

    init(_ persistent: Persistent) {
        self.persistent = persistent
        do {
            setting = try persistent.getObject(forKey: SETTING) as! Setting
        } catch {
            setting = Setting.default
        }
    }

    func setSetting(setting: Setting) {
        persistent.set(setting, forKey: SETTING)
        self.setting = setting
    }
}
