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
    @State var showAll: Bool = true

    @EnvironmentObject var svm: SettingViewModel
    @EnvironmentObject var cvm: CalendarViewModel
    @EnvironmentObject var pvm: PomodoroViewModal

    func todaysTasksText(text: String) -> Text {
        Text(text)
            .font(.custom("Poppins-Medium", size: 12))
    }

    func showingTasks() -> [Task] {
        if showAll {
            return cvm.todayTasks
        }

        return cvm.todayTasks.filter { $0.done ? false : true }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                HStack(spacing: 0) {
                    todaysTasksText(text: "Today's tasks ")
                        .foregroundColor(Color("Black40"))
                    todaysTasksText(text: "\(cvm.todayDoneTasks.count)")
                        .foregroundColor(pvm.status.MainColor())
                    todaysTasksText(text: "/\(cvm.todayTasks.count)")
                        .foregroundColor(Color("Black40"))
                }
                .frame(width: 162, height: 18, alignment: .topLeading)
                .padding([.leading], 20)

                Spacer()
                Button(action: {
                    showAll = !showAll
                }) {
                    Text("\(showAll ? "Hide" : "Show All")")
                        .font(.custom("Poppins-Medium", size: 12))
                        .foregroundColor(Color("Black20"))
                        .padding([.trailing], 20)
                }
                .buttonStyle(PlainButtonStyle())
            }
            List {
                ForEach(showingTasks()) { task in
                    if #available(OSX 11.0, *) {
                        TaskRow(task: task)
                            .listRowInsets(.init(top: 0, leading: 12, bottom: 8, trailing: 12))
                            .help("\(task.title)")
                    } else {
                        TaskRow(task: task)
                            .listRowInsets(.init(top: 0, leading: 12, bottom: 8, trailing: 12))
                    }
                }
            }
            .padding([.top], 7)
            .listStyle(PlainListStyle())
        }
        .onAppear {
            do {
                try cvm.sync()
            } catch {
                print(error)
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
            .environmentObject(PomodoroViewModal(settingManager: settingManager))
    }
}
