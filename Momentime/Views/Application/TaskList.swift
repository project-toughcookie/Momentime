//
//  TaskList.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/24.
//

import SwiftUI

extension NSTableView {
    override open func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()

        backgroundColor = NSColor.clear
        enclosingScrollView!.drawsBackground = false
    }
}

struct TaskList: View {
    @EnvironmentObject var svm: SettingViewModel
    @EnvironmentObject var cvm: CalendarViewModel

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Today’s tasks \(cvm.todayDoneTasks.count)/\(cvm.todayTasks.count)")
                    .font(.custom("Poppins-Regular", size: 12))
                    .frame(width: 162, height: 18, alignment: .topLeading)
                    .padding([.leading], 20)

                Spacer()
                Text("Hide")
                    .font(.custom("Poppins-Regular", size: 12))
                    .padding([.trailing], 20)
            }
            List {
                ForEach(cvm.todayTasks) { task in
                    TaskRow(task: task)
                        .listRowInsets(.init(top: 0, leading: 12, bottom: 7, trailing: 12))
                }
            }
            .padding([.top], 7)
            .listStyle(PlainListStyle())
        }
        .onAppear {
            cvm.fetchCalendars()
            do {
                try cvm.fetchTodayTasks(calendarId: svm.defaultCalendar)
            } catch {
                // TODO: 오늘 테스크 불러오기 실패 예외처리
            }
        }
        .frame(
            width: Constants.MENUBAR_WIDTH,
            height: Constants.TASKLIST_HEIGHT,
            alignment: .topLeading
        )
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let calendarManager = AppleCalendarManager(store: MockEventStore())

        TaskList()
            .environmentObject(SettingViewModel(settingManager: settingManager))
            .environmentObject(CalendarViewModel(calendarManager: calendarManager, settingManager: settingManager))
    }
}
