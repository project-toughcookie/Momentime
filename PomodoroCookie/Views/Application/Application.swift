//
//  ContentView.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct ApplicationView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
            Spacer()
            HStack {
                Spacer()
                SettingContextMenu()
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
    }
}
