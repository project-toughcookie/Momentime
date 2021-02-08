//
//  Footer.swift
//  Momentime
//
//  Created by 성준영 on 2021/02/07.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {}, label: {
                Image("icon_setting")
            })
                .buttonStyle(PlainButtonStyle())
            Spacer()
            Button(action: {}, label: {
                Image("icon_add_task")
            })
                .buttonStyle(PlainButtonStyle())
        }
        .padding(20)
        .frame(
            width: Constants.CONTENT_WIDTH,
            height: Constants.FOOTER_HEIGHT,
            alignment: .topLeading
        )
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
