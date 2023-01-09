//
//  RMCharacterViewController.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 06.01.2023.
//

import UIKit

class RMCharacterViewController: UIViewController {

    let charactersListView: RMCharactersListView = {
        var view = RMCharactersListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        view.addSubview(charactersListView)
        
        addConstraints()
        
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            charactersListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charactersListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            charactersListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charactersListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        ])
    }
    
}
