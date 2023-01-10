//
//  RMCharacterStatus.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 06.01.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
