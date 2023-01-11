//
//  RMCharacterViewController.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 06.01.2023.
//

import UIKit

class RMCharacterViewController: UIViewController {
    
    // MARK: - Views
    
    let charactersListView: RMCharactersListView = {
        var view = RMCharactersListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        setup()
        charactersListView.delegate = self
    }
    
    // MARK: - Methods
    
    func setup() {
        setupViews()
        addConstraints()
    }
    
    func setupViews() {
        [charactersListView].forEach{
            view.addSubview($0)
        }
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

// MARK: - RMCharactersListViewProtocol

extension RMCharacterViewController: RMCharactersListViewProtocol{
    func rmCharactersListView(_ charactersListView: RMCharactersListView, didSelectCharacter character: RMCharacter) {
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}




