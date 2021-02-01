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
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: pvm.status.ColorGradient(),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: metrics.size.width * pvm.remainRatio)
                }
            }
            .frame(width: Constants.MENUBAR_WIDTH, height: 60)
            .background(Color("Gray05"))
            Spacer()
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
