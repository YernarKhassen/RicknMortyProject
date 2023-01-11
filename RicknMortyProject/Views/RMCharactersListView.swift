//
//  RMCharactersList.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 08.01.2023.
//

import UIKit

protocol RMCharactersListViewProtocol: AnyObject {
    func rmCharactersListView(_ charactersListView: RMCharactersListView, didSelectCharacter character: RMCharacter)
}

class RMCharactersListView: UIView {

    public weak var delegate: RMCharactersListViewProtocol?
    
    private let viewModel = RMCharatersListViewViewModel()
    
    // MARK: - Views
    
    private let spinner: UIActivityIndicatorView = {
        var spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
//        backgroundColor = .systemBlue
        
        addConstraints()
        
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharacters()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Methods
    
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
            
        })
    }
}

// MARK: - RMCharactersListViewViewModelDelegate

extension RMCharactersListView: RMCharactersListViewViewModelDelegate {
    func didSelectCharacter(_ character: RMCharacter) {
        delegate?.rmCharactersListView(self, didSelectCharacter: character)
    }
    
    func didLoadInitialCharacters() {
        spinner.stopAnimating()
        charactersCollectionView.isHidden = false
        charactersCollectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.charactersCollectionView.alpha = 1
        }
    }
}
