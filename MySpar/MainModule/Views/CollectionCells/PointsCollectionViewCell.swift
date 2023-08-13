//
//  PointsCollectionViewCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 14.08.2023.
//

import UIKit

final class PointsCollectionViewCell: UICollectionViewCell {
    static let identifier = "PointsCollectionViewCell"
    
    //MARK: - photoImageView
    private lazy var photoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "points")
        img.contentMode = .scaleAspectFit
        
        img.clipsToBounds = true
        
        return img
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        //MARK: - photoImageView constraints
        contentView.addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


