//
// Created by 성준영 on 2020/12/31.
//

import Foundation

let SETTING = "setting"

final class SettingManager: ObservableObject {
    @Published var setting: Setting

    init(persistent: Persistent) {
        do {
            setting = try persistent.getObject(forKey: SETTING) as! Setting
        } catch {
            setting = Setting.default
        }
    }
}
