//
//  Task.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/04.
//

import Foundation

struct Task: Codable, Identifiable {
    let id: String
    let title: String
    let start: Date
    let end: Date
    let done: Bool
    let workInProgress: Bool
}
