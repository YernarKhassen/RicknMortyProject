//
//  RMCharatersListViewViewModel.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 08.01.2023.
//

import UIKit

final class RMCharatersListViewViewModel: NSObject {
    public func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Image Url: \(model.results.first?.image)")
//                print("Pages: \(model.results.count)")
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
}

extension RMCharatersListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Yernar", characterStatus: .alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
    
    
}
