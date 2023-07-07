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
        
        // Create the avatar and username subviews
        let usernameLabel = createUsernameLabel(16, .bold)
        let avatar = createAvatarView()
        
        contentView.addSubview(avatar)
        contentView.addSubview(usernameLabel)
        
        // Configure constraints
        let padding: CGFloat = 10
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatar.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            usernameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: padding)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
