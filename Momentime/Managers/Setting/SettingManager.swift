//
// Created by 성준영 on 2020/12/31.
//

import Foundation

let SETTING = "setting"
let EVENT_TITLE_CHANGED_IF_DONE = "\(SETTING).eventTitleChangedIfDone"
let TIMER_SOUND_ENABLED = "\(SETTING).timerSoundEnabled"
let TIMER_AUTO_STARTED = "\(SETTING).timerAutoStarted"
let DEFAULT_CALENDAR = "\(SETTING).defaultCalendar"

final class SettingManager {
    private let persistent: Persistent

    public var eventTitleChangedIfDone: Bool {
        get {
            do {
                return try persistent.getBool(forKey: EVENT_TITLE_CHANGED_IF_DONE)
            } catch {
                return Setting.default.eventTitleChangedIfDone
            }
        }
        set(newEventTitleChangedIfDone) {
            persistent.set(newEventTitleChangedIfDone, forKey: EVENT_TITLE_CHANGED_IF_DONE)
        }
    }

    public var timerSoundEnabled: Bool {
        get {
            do {
                return try persistent.getBool(forKey: TIMER_SOUND_ENABLED)
            } catch {
                return Setting.default.timerSoundEnabled
            }
        }
        set(newTimerSoundEnabled) {
            persistent.set(newTimerSoundEnabled, forKey: TIMER_SOUND_ENABLED)
        }
    }

    public var timerAutoStarted: Bool {
        get {
            do {
                return try persistent.getBool(forKey: TIMER_AUTO_STARTED)
            } catch {
                return Setting.default.timerAutoStarted
            }
        }
        set(newTimerAutoStarted) {
            persistent.set(newTimerAutoStarted, forKey: TIMER_AUTO_STARTED)
        }
    }

    public var defaultCalendar: String {
        get {
            do {
                return try persistent.getString(forKey: DEFAULT_CALENDAR)
            } catch {
                return Setting.default.defaultCalendar
            }
        }
        set(newDefaultCalendar) {
            persistent.set(newDefaultCalendar, forKey: DEFAULT_CALENDAR)
        }
    }

    init(persistent: Persistent = UserDefaultsPersistent()) {
        self.persistent = persistent
    }
}
