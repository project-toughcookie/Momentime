//
//  I18N.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/03.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
