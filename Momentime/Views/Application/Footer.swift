//
//  Footer.swift
//  Momentime
//
//  Created by 성준영 on 2021/02/07.
//

import SwiftUI

struct Footer: View {
    @EnvironmentObject var tvm: TaskViewModel

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {}, label: {
                Image("icon_setting")
            })
                .buttonStyle(PlainButtonStyle())
            Spacer()
            Text(tvm.getDefaultCalendar())
                .padding([.trailing], 12)
            Button(action: {}, label: {
                Image("icon_add_task")
            })
                .buttonStyle(PlainButtonStyle())
        }
        .padding(20)
        .frame(
            width: Constants.CONTENT_WIDTH,
            height: Constants.FOOTER_HEIGHT,
            alignment: .topLeading
        )
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let settingManager = SettingManager(persistent: MemoryPersistent())
        Footer()
            .environmentObject(TaskViewModel(calendarManager: calendarManager, settingManager: settingManager))
    }
}
