//
//  Timer.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/18.
//

import SwiftUI

struct TimerHeader: View {
    @EnvironmentObject var pvm: PomodoroViewModal

    func toFixedSize(_ num: Int) -> String {
        if num / 10 < 1 {
            return "0\(num)"
        }
        return "\(num)"
    }

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                switch pvm.status {
                case .stop:
                    pvm.setStatus(status: .play)
                case .play:
                    pvm.setStatus(status: .pause)
                case .pause:
                    if pvm.prevStatus == .play {
                        pvm.setStatus(status: .play)
                    } else {
                        pvm.setStatus(status: .break)
                    }
                case .break:
                    pvm.setStatus(status: .pause)
                }
            }) {
                Image("TimerPause")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .buttonStyle(PlainButtonStyle())
            .padding([.leading], 20)
            .padding([.top], 27)

            Text("\(toFixedSize(pvm.remainSeconds / 60)):\(toFixedSize(pvm.remainSeconds % 60))")
                .font(.custom("Poppins-Medium", size: 32))
                .foregroundColor(pvm.status.ColorWithOpacity(opacity: ._100))
                .lineSpacing(48)
                .padding([.top], 18)
                .padding([.leading], 8)

            Spacer()
            Text(pvm.status.TimerLabel())
                .font(.custom("Poppins-Regular", size: 12))
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .frame(height: 22)
                .foregroundColor(.white)
                .background(pvm.status.ColorWithOpacity(opacity: ._100))
                .cornerRadius(100)
                .padding([.trailing], 20)
                .padding([.top], 31)
        }
        .frame(
            width: Constants.MENUBAR_VIEW_WIDTH,
            height: Constants.TIMERHEADER_VIEW_HEIGHT,
            alignment: .topLeading
        )
    }
}

struct TimerHeader_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        Group {
            TimerHeader()
                .environmentObject(PomodoroViewModal(settingManager: settingManager))
        }
    }
}
