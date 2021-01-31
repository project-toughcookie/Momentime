//
//  TaskRow.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/24.
//

import SwiftUI

struct TaskRow: View {
    var task: Task

    @EnvironmentObject var pvm: PomodoroViewModal
    @EnvironmentObject var cvm: CalendarViewModel

    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        return dateFormatter.string(from: date)
    }

    func taskTitleText() -> Text {
        let defaultText = Text(task.title)
            .font(.custom("Poppins-Medium", size: 16))

        if task.done {
            return defaultText.strikethrough().foregroundColor(Color("Black20"))
        }

        return defaultText
            .foregroundColor(Color("Black100"))
    }

    func checkImage() -> some View {
        let defaultImage: Image = pvm.status.CheckButton(checked: task.done).renderingMode(.template)
        if task.done {
            return defaultImage.foregroundColor(pvm.status.ColorWithOpacity(opacity: ._100))
        }
        return defaultImage.foregroundColor(Color("Black100"))
    }

    func isInProgress() -> Bool {
        task.isAllDay || (task.start ... task.end).contains(Date())
    }

    func dateRangeText() -> Text {
        var text = "\(dateToString(date: task.start)) - \(dateToString(date: task.end))"
        if task.isAllDay {
            text = "All-day"
        }
        let defaultText = Text(text).font(.custom("Poppins-Regular", size: 12))

        if isInProgress() {
            return defaultText.foregroundColor(pvm.status.MainColor())
        }

        if task.done {
            return defaultText.foregroundColor(Color("Black20"))
        }

        return defaultText.foregroundColor(Color("Black40"))
    }

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 1, green: 1, blue: 1))
                .frame(width: 280, height: 56)
            HStack(spacing: 0) {
                Button(action: {
                    do {
                        try cvm.toggleTaskDone(taskId: task.id)
                    } catch {
                        print(error)
                    }
                }, label: {
                    checkImage()
                })
                    .buttonStyle(PlainButtonStyle())
                    .padding([.leading], 12)
                    .padding([.trailing], 10)

                VStack(alignment: .leading, spacing: 0) {
                    taskTitleText()
                        .frame(width: 222, height: 24, alignment: .topLeading)
                        .lineSpacing(24)

                    dateRangeText()
                        .font(.custom("Poppins-Regular", size: 12))
                }
            }
        }
        .frame(width: 280, height: 56, alignment: .leading)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 2, y: 1)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        let calendarManager = AppleCalendarManager(store: MockEventStore())
        let settingManager = SettingManager(persistent: MemoryPersistent())
        Group {
            TaskRow(task: Task(id: "test", title: "Create Unit test", isAllDay: false, start: Date(), end: Date(), notes: "[완료][Done]"))
                .environmentObject(PomodoroViewModal(settingManager: settingManager))
                .environmentObject(CalendarViewModel(calendarManager: calendarManager, settingManager: settingManager))

            TaskRow(task: Task(id: "test", title: "Test Unit test", isAllDay: true, start: Date(), end: Date(), notes: ""))
                .environmentObject(PomodoroViewModal(settingManager: settingManager))
                .environmentObject(CalendarViewModel(calendarManager: calendarManager, settingManager: settingManager))
        }
    }
}
