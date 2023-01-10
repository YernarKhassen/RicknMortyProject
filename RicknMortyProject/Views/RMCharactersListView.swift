//
//  RMCharactersList.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 08.01.2023.
//

import UIKit

class RMCharactersListView: UIView {

    private let viewModel = RMCharatersListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        var spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
//        backgroundColor = .systemBlue
        
        addConstraints()
        
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    func setupViews() {
        [charactersCollectionView, spinner].forEach{
            addSubview($0)
        }
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            charactersCollectionView.topAnchor.constraint(equalTo: topAnchor),
            charactersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            charactersCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            charactersCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
        ])
    }
    
    func setupCollectionView() {
        charactersCollectionView.delegate = viewModel
        charactersCollectionView.dataSource = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            
            self.charactersCollectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.charactersCollectionView.alpha = 1
            }
        })
    }
}
