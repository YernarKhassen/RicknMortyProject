//
//  RMCharacterViewController.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 06.01.2023.
//

import UIKit

class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: \(model.info.count)")
                print("Pages: \(model.results.count)")
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
    
}
