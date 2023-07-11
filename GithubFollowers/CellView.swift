//
//  CellView.swift
//  GithubFollowers
//
//  Created by Shawn Spears on 6/11/23.
//

import UIKit

class CellView: UICollectionViewCell {
    
    static let reuseId = "CellView"
    
    lazy var createAvatarView: () -> UIImageView = {
        let avatar = UIImageView()
        avatar.layer.cornerRadius = 10
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "placeholder")
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }
    
    lazy var createUsernameLabel: (CGFloat, UIFont.Weight) -> UILabel = { fontSize, weight in
        let usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.textAlignment = .center
        usernameLabel.text = "shawnspears"
        usernameLabel.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        return usernameLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        // Create the avatar and username subviews
        let usernameLabel = createUsernameLabel(16, .bold)
        let avatar = createAvatarView()
        
        let stackView = UIStackView(arrangedSubviews: [avatar, usernameLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        contentView.addSubview(stackView)
        
        // Configure constraints
        NSLayoutConstraint.activate([
            avatar.heightAnchor.constraint(equalToConstant: 75),
            avatar.widthAnchor.constraint(equalToConstant: 75),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
