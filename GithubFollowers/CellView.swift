//
//  CellView.swift
//  GithubFollowers
//
//  Created by Shawn Spears on 6/11/23.
//

import UIKit

class CellView: UICollectionViewCell {
    let avatar = createAvatarView()
    let usernameLabel = createUILabel(fontSize: 16, weight: .bold)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(avatar)
        contentView.addSubview(usernameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private func createUILabel(fontSize: CGFloat, weight: UIFont.Weight) -> UILabel {
    let usernameLabel = UILabel()
    usernameLabel.translatesAutoresizingMaskIntoConstraints = false
    usernameLabel.textAlignment = .center
    usernameLabel.text = "shawnspears"
    usernameLabel.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    return usernameLabel
}

private func createAvatarView() -> UIImageView {
    let avatar = UIImageView()
    avatar.layer.cornerRadius = 10
    avatar.clipsToBounds = true
    avatar.image = UIImage(named: "placeholder")
    avatar.translatesAutoresizingMaskIntoConstraints = false
    return avatar
}
