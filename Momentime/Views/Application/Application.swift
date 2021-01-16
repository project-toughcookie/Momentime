//
//  ContentView.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/01.
//

import SwiftUI

struct ApplicationView: View {
    @EnvironmentObject var svm: SettingViewModel
    @EnvironmentObject var cvm: CalendarViewModel

    var body: some View {
        ZStack {
            GradientBackground()
            VStack {
                Spacer()
                VStack {
                    Text("MOMENTIME")
                }
                .frame(width: Constants.MENUBAR_VIEW_WIDTH, height: Constants.MENUBAR_VIEW_HEIGHT - 28)
                .background(Color("Gray05"))
                .background(VisualEffectView(
                    material: NSVisualEffectView.Material.popover,
                    blendingMode: NSVisualEffectView.BlendingMode.withinWindow
                )
                )
                .cornerRadius(12)
            }
            .frame(width: Constants.MENUBAR_VIEW_WIDTH,
                   height: Constants.MENUBAR_VIEW_HEIGHT)
        }
        .onAppear {
            cvm.requestAccess()
            cvm.fetchCalendars()
        }
        .frame(width: Constants.MENUBAR_VIEW_WIDTH,
               height: Constants.MENUBAR_VIEW_HEIGHT)
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
            .environmentObject(SettingViewModel(persistent: MemoryPersistent()))
            .environmentObject(CalendarViewModel(store: MockEventStore()))
    }
}
