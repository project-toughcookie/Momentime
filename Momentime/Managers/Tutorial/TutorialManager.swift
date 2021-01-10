//
// Created by 성준영 on 2021/01/01.
//

import Foundation

let TUTORIAL = "tutorial"
let TUTORIAL_SHOWN = "\(TUTORIAL).tutorialShown"

class TutorialManager {
    private var persistent: Persistent
    private var tutorialShownDefault: Bool = false

    public var tutorialShown: Bool {
        get {
            do {
                return try persistent.getBool(forKey: TUTORIAL_SHOWN)
            } catch {
                return tutorialShownDefault
            }
        }
        set(newTutorialShown) {
            persistent.set(newTutorialShown, forKey: TUTORIAL_SHOWN)
        }
    }

    init(_ persistent: Persistent) {
        self.persistent = persistent
    }
}
