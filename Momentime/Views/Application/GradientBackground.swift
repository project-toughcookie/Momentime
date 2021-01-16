//
// Created by 성준영 on 2021/01/16.
//

import Foundation
import SwiftUI

struct GradientBackground: View {
    @State var ratio: CGFloat = 0.7
    var body: some View {
        VStack {
            GeometryReader { metrics in
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color("PlayFrom"), Color("PlayTo")]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: metrics.size.width * ratio)
                }
            }
            .frame(width: Constants.MENUBAR_VIEW_WIDTH, height: 60)
            .background(Color("Gray05"))
            Spacer()
        }
        .cornerRadius(12)
        .frame(
            width: Constants.MENUBAR_VIEW_WIDTH,
            height: Constants.MENUBAR_VIEW_HEIGHT
        )
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
