//
//  RMGetAllCharactersResponse.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 07.01.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
