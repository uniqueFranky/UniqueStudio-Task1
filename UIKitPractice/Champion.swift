//
//  Champion.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import Foundation

class Champion: Codable, Identifiable {
    var id: Int
    var name: String
    var position: String
    var description: String
    var skills: [Skill]
}

class Skill: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var videoable: Bool
}
