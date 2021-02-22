//
//  TutorialPage.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct TutorialView: View {
    @EnvironmentObject var tvm: TaskViewModel
    @EnvironmentObject var svm: SettingViewModel

    var body: some View {
        VStack {
            List(tvm.calendars, id: \.id) { calendar in
                Button(action: {
                    svm.setDefaultCalendar(calendar.id)
                    svm.setTutorialShown(true)
                }) {
                    Text("\(calendar.title)")
                }
            }
            Text("Tutorial !")
        }
        .frame(width: Constants.TUTORIAL_WIDTH,
               height: Constants.TUTORIAL_HEIGHT,
               alignment: .leading)
        .onAppear {
            tvm.fetchCalendars()
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())

        TutorialView()
            .environmentObject(TaskViewModel(calendarManager: calendarManager, settingManager: settingManager))
            .environmentObject(SettingViewModel(settingManager: settingManager))
    }
}
