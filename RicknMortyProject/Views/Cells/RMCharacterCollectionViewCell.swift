//
//  RMCharacterCollectionViewCell.swift
//  RicknMortyProject
//
//  Created by Ernar Khasen on 09.01.2023.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    // MARK: - Views

    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    func setup() {
        setupViews()
        addCOnstraints()
    }
    
    func setupViews() {
        [characterImageView, nameLabel, statusLabel].forEach{
            contentView.addSubview($0)
        }
    }
    
    private func addCOnstraints() {
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -3),
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 3),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -3),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            characterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
        ])
        
//        statusLabel.backgroundColor = .red
//        nameLabel.backgroundColor = .green
//        characterImageView.backgroundColor = .orange
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.characterImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
            
        }
    }
}
