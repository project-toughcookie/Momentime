//
//  TaskRow.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/24.
//

import SwiftUI

struct TaskRow: View {
    @EnvironmentObject var pvm: PomodoroViewModal
    var task: Task

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 1, green: 1, blue: 1))
                .frame(width: 280, height: 56)
            HStack(spacing: 0) {
                Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                    pvm.status.CheckButton(checked: true)
                        .renderingMode(.template)
                        .foregroundColor(pvm.status.ColorWithOpacity(opacity: ._100))
                })
                    .buttonStyle(PlainButtonStyle())
                    .padding([.leading], 12)
                    .padding([.trailing], 10)

                VStack(alignment: .leading, spacing: 0) {
                    Text(task.title)
                        .font(.custom("Poppins-SemiBold", size: 16))
                        .frame(width: 222, height: 24, alignment: .topLeading)
                        .lineSpacing(24)

                    if task.isAllDay {
                        Text("All-Day")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(pvm.status.ColorWithOpacity(opacity: ._100))
                    } else {
                        Text("22:00 - 23:30")
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                }
            }
        }
        .frame(width: 280, height: 56, alignment: .leading)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 10, y: 2)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        Group {
            TaskRow(task: Task(id: "test", title: "Create Unit test", isAllDay: false, start: Date(), end: Date(), notes: "[완료][Done]"))
                .environmentObject(PomodoroViewModal(settingManager: settingManager))
            TaskRow(task: Task(id: "test", title: "Test Unit test", isAllDay: true, start: Date(), end: Date(), notes: ""))
                .environmentObject(PomodoroViewModal(settingManager: settingManager))
        }
    }
}
