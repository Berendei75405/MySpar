//
//  DiscountCollectionViewCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 13.08.2023.
//

import UIKit

final class DiscountCollectionViewCell: UICollectionViewCell {
    static let identifier = "DiscountCollectionViewCell"
    
    //MARK: - discountImageView
    private let discountImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        
        return img
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        //MARK: - discountImageView
        contentView.addSubview(discountImageView)
        NSLayoutConstraint.activate([
            discountImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            discountImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            discountImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            discountImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    //MARK: - confugurate
    func confugurate(photo: UIImage) {
        self.discountImageView.image = photo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
