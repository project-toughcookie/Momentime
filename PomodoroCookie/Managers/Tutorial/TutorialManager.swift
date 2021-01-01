//
// Created by 성준영 on 2021/01/01.
//

import Foundation

let TUTORIAL_SHOWN = "tutorialShown"

class TutorialManager: ObservableObject {
    private var persistent: Persistent
    @Published var tutorialShown: Bool = false

    init(_ persistent: Persistent) {
        self.persistent = persistent
        do {
            tutorialShown = try persistent.getObject(forKey: TUTORIAL_SHOWN) as! Bool
        } catch {
            tutorialShown = false
        }
    }

    public func SetTutorialToShown() {
        persistent.set(true, forKey: TUTORIAL_SHOWN)
        tutorialShown = true
    }
}
