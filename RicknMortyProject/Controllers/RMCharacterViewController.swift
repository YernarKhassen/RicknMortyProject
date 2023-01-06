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
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [URLQueryItem(name: "name", value: "rick")]
        )
        
        print(request.url)
    }

}
