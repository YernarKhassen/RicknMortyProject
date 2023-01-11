//
//  RMCharacterDetailViewViewModel.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 11.01.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel: NSObject {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
}
