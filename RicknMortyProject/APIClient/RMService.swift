//
//  RMService.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 06.01.2023.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    public func execute(_ request: RMRequest,  completion: @escaping () -> Void) {
        
    }
}
