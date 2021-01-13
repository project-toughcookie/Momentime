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

    var body: some View {
        VStack {
            Text("Hello, world!")
            Text("Granted: \(String(cvm.granted))")
            Text("Timer AutoStarted: \(String(svm.timerAutoStarted))")

            List(cvm.calendars, id: \.id) { calendar in
                Text("\(calendar.title)")
            }
            List(cvm.todayTasks, id: \.id) { task in
                Text("\(task.title)")
            }
            Spacer()
            HStack {
                Spacer()
                SettingContextMenu()
            }
        }
        .onAppear {
            cvm.requestAccess()
            cvm.fetchCalendars()
        }
        .onReceive(cvm.$calendars) { calendars in
            if calendars.count != 0 {
                do {
                    try cvm.fetchTodayTasks(calendarId: calendars[1].id)
                } catch {
                    print(error)
                }
            }
        }
        .padding()
        .frame(width: Constants.MENUBAR_VIEW_WIDTH,
               height: Constants.MENUBAR_VIEW_HEIGHT,
               alignment: .leading)
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
            .environmentObject(SettingViewModel(persistent: MemoryPersistent()))
            .environmentObject(CalendarViewModel(store: MockEventStore()))
    }
}
