//
//  Calendar.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/04.
//

import Foundation

struct Calendar {
    let id: String
    let title: String
    let color: CGColor
    let allowModification: Bool

    init(id: String, title: String, color: CGColor, allowModification: Bool) {
        self.id = id
        self.title = title
        self.color = color
        self.allowModification = allowModification
    }
}
