//
// Created by 성준영 on 2021/01/26.
//

@testable import Momentime
import SwiftUI
import XCTest

class StatusTests: XCTestCase {
    func testStatusColorWithOpacity() {
        XCTAssertEqual(Status.stop.ColorWithOpacity(opacity: Opacity._15), Color("Black15"))
        XCTAssertEqual(Status.pause.ColorWithOpacity(opacity: Opacity._15), Color("Black15"))
        XCTAssertEqual(Status.play.ColorWithOpacity(opacity: Opacity._15), Color("Red15"))
        XCTAssertEqual(Status.break.ColorWithOpacity(opacity: Opacity._15), Color("Green15"))
    }

    func testStatusColorGradient() {
        XCTAssertEqual(Status.stop.ColorGradient(), Gradient(colors: [Color("PauseFrom"), Color("PauseTo")]))
        XCTAssertEqual(Status.pause.ColorGradient(), Gradient(colors: [Color("PauseFrom"), Color("PauseTo")]))
        XCTAssertEqual(Status.play.ColorGradient(), Gradient(colors: [Color("PlayFrom"), Color("PlayTo")]))
        XCTAssertEqual(Status.break.ColorGradient(), Gradient(colors: [Color("BreakFrom"), Color("BreakTo")]))
    }

    func testStatusTimerLabel() {
        XCTAssertEqual(Status.stop.TimerLabel(), "Stopping")
        XCTAssertEqual(Status.pause.TimerLabel(), "Pausing")
        XCTAssertEqual(Status.play.TimerLabel(), "It's Time to Focus⚡️")
        XCTAssertEqual(Status.break.TimerLabel(), "Break Time... 😌")
    }

    func testStatusTimerButton() {
        XCTAssertEqual(Status.stop.TimerButton(), Image("icon_timer_play"))
        XCTAssertEqual(Status.pause.TimerButton(), Image("icon_timer_play"))
        XCTAssertEqual(Status.play.TimerButton(), Image("icon_timer_pause_focus"))
        XCTAssertEqual(Status.break.TimerButton(), Image("icon_timer_pause_break"))
    }

    func testStatusCheckButton() {
        XCTAssertEqual(Status.stop.CheckButton(checked: true), Image("icon_list_check_checked"))
        XCTAssertEqual(Status.pause.CheckButton(checked: true), Image("icon_list_check_checked"))
        XCTAssertEqual(Status.play.CheckButton(checked: true), Image("icon_list_check_checked"))
        XCTAssertEqual(Status.break.CheckButton(checked: true), Image("icon_list_check_checked"))

        XCTAssertEqual(Status.stop.CheckButton(checked: false), Image("icon_list_check_default"))
        XCTAssertEqual(Status.pause.CheckButton(checked: false), Image("icon_list_check_default"))
        XCTAssertEqual(Status.play.CheckButton(checked: false), Image("icon_list_check_default"))
        XCTAssertEqual(Status.break.CheckButton(checked: false), Image("icon_list_check_default"))
    }
}
