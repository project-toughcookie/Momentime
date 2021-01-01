//
//  TutorialRoot.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct TutorialRoot: View {
    @EnvironmentObject var appConfig: AppConfig
    
    var body: some View {
        if !appConfig.tutorialShown {
            TutorialPage()
                .onDisappear {
                    appConfig.setTutorialShownTrue()
                }
        }
    }
}

struct TutorialRoot_Previews: PreviewProvider {
    static var previews: some View {
        TutorialRoot().environmentObject(AppConfig.shared)
    }
}
