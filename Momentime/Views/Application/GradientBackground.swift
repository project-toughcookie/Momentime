//
// Created by 성준영 on 2021/01/16.
//

import Foundation
import SwiftUI

struct GradientBackground: View {
    @EnvironmentObject var pvm: PomodoroViewModal

    var body: some View {
        VStack {
            GeometryReader { metrics in
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        if pvm.remainRatio != 1 {
                            Spacer()
                        }
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: pvm.status.ColorGradient(),
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                            .frame(width: 24, height: metrics.size.height * pvm.remainRatio)
                    }
                    Spacer()
                }
            }
            .background(Color("Gray05"))
        }
        .frame(
            width: Constants.MENUBAR_WIDTH,
            height: Constants.MENUBAR_HEIGHT
        )
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        GradientBackground()
            .environmentObject(PomodoroViewModal(settingManager: settingManager))
    }
}
