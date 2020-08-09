//
//  MZCategoryCell.swift
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/9.
//  Copyright © 2020 孟令宗. All rights reserved.
//

import UIKit

class MZCategoryCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 4
        layer.masksToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        titleLabel.frame = contentView.bounds
        
    }
    
    func showInfo(_ title: String, imageName: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageName)
    }
    
    lazy var imageView: UIImageView = {
        let temp = UIImageView()
        return temp
    }()
    
    lazy var titleLabel: UILabel = {
        let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 23))
        leftLabel.textAlignment = .center
        leftLabel.backgroundColor = UIColor.clear
        leftLabel.text = "截止时间"
        leftLabel.textColor = .white
        leftLabel.font = UIFont.italicSystemFont(ofSize: 30)
        return leftLabel
    }()
}
