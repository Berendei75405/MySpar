//
//  StoriesCollectionViewCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 13.08.2023.
//

import UIKit

final class StoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "StoriesCollectionViewCell"
    
    //MARK: - titleLabel
    private let titleLabel: UILabel = {
        let lab = UILabel()
        
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "Привилегии «Мой SPAR»"
        lab.textColor = .gray
        lab.font = UIFont.systemFont(ofSize: 10)
        lab.textAlignment = .center
        lab.lineBreakMode = .byWordWrapping
        lab.numberOfLines = 3
        
        return lab
    }()
    
    //MARK: - storiesImageView
    private lazy var storiesImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "stories")
        img.contentMode = .scaleAspectFill
        img.frame.size = CGSize(width: contentView.frame.width - 5,
                                height: contentView.frame.width - 5)
        img.layer.cornerRadius = img.frame.width/2
        img.layer.borderWidth = 3
        img.layer.borderColor = #colorLiteral(red: 0.3880227506, green: 0.7507314086, blue: 0.40290007, alpha: 1)
        
        img.clipsToBounds = true
        
        return img
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        //MARK: - storiesImageView constraints
        contentView.addSubview(storiesImageView)
        NSLayoutConstraint.activate([
            storiesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storiesImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            storiesImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -5),
            storiesImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, constant: -5)
        ])
        
        //MARK: - titleLabel
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: storiesImageView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -3),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 3)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
