//
//  ContentView.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct ApplicationView: View {
    @EnvironmentObject var svm: SettingViewModel
    @EnvironmentObject var pvm: PermissionViewModel

    var body: some View {
        VStack {
            Text("Hello, world!")
            Text("Granted: \(String(pvm.granted))")
            Text("Timer AutoStarted: \(String(svm.timerAutoStarted))")

            Spacer()
            HStack {
                Spacer()
                SettingContextMenu()
            }
        }
        .onAppear {
            pvm.request()
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
            .environmentObject(SettingViewModel(persistent: MemoryPersistent()))
            .environmentObject(PermissionViewModel())
    }
}
