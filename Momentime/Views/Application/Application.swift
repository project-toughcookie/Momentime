//
//  ContentView.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct ApplicationView: View {
    @EnvironmentObject var svm: SettingViewModel
    @EnvironmentObject var tvm: TaskViewModel
    @EnvironmentObject var pvm: PomodoroViewModal

    var body: some View {
        ZStack(alignment: .trailing) {
            GradientBackground()
            VStack {
                VStack(spacing: 0) {
                    TimerHeader()
                    TaskList()
                    Footer()
                }
                .frame(
                    width: Constants.CONTENT_WIDTH,
                    height: Constants.CONTENT_HEIGHT,
                    alignment: .top
                )
                .background(VisualEffectView(
                    material: NSVisualEffectView.Material.popover,
                    blendingMode: NSVisualEffectView.BlendingMode.withinWindow
                ))
            }
            .border(Color(CGColor(red: 0, green: 0, blue: 0, alpha: 0.05)), width: 1)
            .frame(width: Constants.CONTENT_WIDTH,
                   height: Constants.CONTENT_HEIGHT)
            .cornerRadius(12)
        }
        .onAppear {
            tvm.requestAccess()
            tvm.fetchCalendars()
        }
        .frame(width: Constants.MENUBAR_WIDTH,
               height: Constants.MENUBAR_HEIGHT)
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())

        ApplicationView()
            .environmentObject(SettingViewModel(settingManager: settingManager))
            .environmentObject(TaskViewModel(calendarManager: calendarManager, settingManager: settingManager))
            .environmentObject(PomodoroViewModal(settingManager: settingManager))
    }
}
