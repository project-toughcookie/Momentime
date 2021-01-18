//
//  ContentView.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct ApplicationView: View {
    @EnvironmentObject var svm: SettingViewModel
    @EnvironmentObject var cvm: CalendarViewModel
    @EnvironmentObject var pvm: PomodoroViewModal

    var body: some View {
        ZStack {
            GradientBackground()
            VStack {
                Spacer()
                VStack {
                    TimerHeader()
                    Text("MOMENTIME")
                    Text("Remain: \(pvm.remainSeconds)")
                }
                .frame(
                    width: Constants.MENUBAR_VIEW_WIDTH,
                    height: Constants.CONTENT_VIEW_HEIGHT,
                    alignment: .top
                )
                .background(VisualEffectView(
                    material: NSVisualEffectView.Material.popover,
                    blendingMode: NSVisualEffectView.BlendingMode.withinWindow
                ))
                .cornerRadius(12)
            }
            .frame(width: Constants.MENUBAR_VIEW_WIDTH,
                   height: Constants.MENUBAR_VIEW_HEIGHT)
        }
        .onAppear {
            cvm.requestAccess()
            cvm.fetchCalendars()
        }
        .frame(width: Constants.MENUBAR_VIEW_WIDTH,
               height: Constants.MENUBAR_VIEW_HEIGHT)
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())

        ApplicationView()
            .environmentObject(SettingViewModel(settingManager: settingManager))
            .environmentObject(CalendarViewModel(calendarManager: calendarManager, settingManager: settingManager))
            .environmentObject(PomodoroViewModal(settingManager: settingManager))
    }
}
