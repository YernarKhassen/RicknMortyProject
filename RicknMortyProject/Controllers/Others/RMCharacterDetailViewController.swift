//
//  RMCharacterDetailViewController.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 11.01.2023.
//

import UIKit

class RMCharacterDetailViewController: UIViewController {

    private var viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }
}
