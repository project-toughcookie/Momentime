//
// Created by 성준영 on 2021/01/01.
//

import Foundation

let TUTORIAL_SHOWN = "tutorialShown"

final class AppConfig: ObservableObject {
    static let shared = AppConfig(UserDefaultsPersistent())

    var persistent: Persistent
    @Published var tutorialShown: Bool = false
    @Published var settingPageAppeared: Bool = false

    init(_ persistent: Persistent) {
        self.persistent = persistent
        do {
            tutorialShown = try persistent.getObject(forKey: TUTORIAL_SHOWN) as! Bool
        } catch {
            tutorialShown = false
        }
    }

    public func setTutorialShownTrue() {
        persistent.set(true, forKey: TUTORIAL_SHOWN)
        tutorialShown = true
    }
}
