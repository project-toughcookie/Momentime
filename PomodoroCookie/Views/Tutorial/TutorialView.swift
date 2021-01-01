//
//  TutorialPage.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        Text("Tutorial !")
            .frame(width: Constants.TUTORIAL_VIEW_WIDTH,
                   height: Constants.TUTORIAL_VIEW_HEIGHT,
                   alignment: .leading)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
