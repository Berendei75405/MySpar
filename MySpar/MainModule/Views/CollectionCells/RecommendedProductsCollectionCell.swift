//
//  RecommendedProductsCollectionCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 14.08.2023.
//

import UIKit

final class RecommendedProductsCollectionCell: UICollectionViewCell {
    static let identifier = "RecommendedProductsCollectionCell"
    
    //MARK: - container
    private let container: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.masksToBounds = false
        
        return mainView
    }()
    
    //MARK: - photoImageView
    private let photoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        
        return img
    }()
    
    //MARK: - categoryLabel
    private let categoryLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.textColor = .white
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 9.5)
        lab.frame.size = CGSize(width: 50, height: 50)
        lab.layer.cornerRadius = 8
        lab.clipsToBounds = true
        
        return lab
    }()
    
    //MARK: - priceLabel
    private let priceLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.textColor = .black
        lab.font = .boldSystemFont(ofSize: 16)
        
        return lab
    }()
    
    //MARK: - oldPriceLabel
    private let oldPriceLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.textColor = .gray
        lab.font = .systemFont(ofSize: 14)
        
        return lab
    }()
    
    //MARK: - countImageView
    private let countImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        
        return img
    }()
    
    //MARK: - buyButton
    private var buyButton: UIButton = {
        var but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.frame.size = CGSize(width: 50, height: 50)
        but.layer.cornerRadius = 17
        but.clipsToBounds = true
        but.setImage(UIImage(named: "buy"), for: .normal)
        but.contentMode = .scaleAspectFit
        
        return but
    }()
    
    //MARK: - discountLabel
    private let discountLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.textColor = .red
        lab.textAlignment = .center
        lab.font = .boldSystemFont(ofSize: 16)
        lab.backgroundColor = .white
        lab.alpha = 0.8
        lab.frame.size = CGSize(width: 50, height: 50)
        lab.layer.cornerRadius = 8
        lab.clipsToBounds = true
        
        return lab
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        contentView.layer.shadowRadius = 1.0
        contentView.layer.shadowOpacity = 1.0
        
        container.frame = contentView.frame
        container.layer.cornerRadius = 10
        container.clipsToBounds = true
        
        //MARK: - container constraints
        contentView.addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        //MARK: - photoImageView constraints
        container.addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
        
        //MARK: - categoryLabel constraints
        photoImageView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: -3),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.frame.width/2 + 12),
            categoryLabel.bottomAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 16)
        ])
        
        //MARK: - buyButton constraints
        container.addSubview(buyButton)
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            buyButton.widthAnchor.constraint(equalToConstant: 33),
            buyButton.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        container.addSubview(discountLabel)
        NSLayoutConstraint.activate([
            discountLabel.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -6),
            discountLabel.leadingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -2)
        ])
    }
    
    //MARK: - configurate
    func configurate(photo: String, price: Float, oldPrice: Float,
                     category: String, discount: Int, weightPhoto: String) {
        self.photoImageView.image = UIImage(named: photo)
        
        //Определение категории
        switch category {
        case "Удар по ценам":
            self.categoryLabel.backgroundColor = #colorLiteral(red: 0.9436149001, green: 0.6263113618, blue: 0.6207460761, alpha: 1)
            self.categoryLabel.isHidden = false
        case "Новинка":
            self.categoryLabel.backgroundColor = #colorLiteral(red: 0.6431301236, green: 0.65268749, blue: 0.8115051389, alpha: 1)
            self.categoryLabel.isHidden = false
        case "Цена по карте":
            self.categoryLabel.backgroundColor = #colorLiteral(red: 0.6246026754, green: 0.8543800712, blue: 0.6710041165, alpha: 1)
            self.categoryLabel.isHidden = false
        default:
            self.categoryLabel.isHidden = true
        }
        self.categoryLabel.text = category
        
        priceLabel.text = String(format: "%.2f", price)
        
        //MARK: - priceLabel, countImageView constraints
        if discount != 0 {
            container.addSubview(priceLabel)
            container.addSubview(countImageView)
            oldPriceLabel.isHidden = false
            discountLabel.isHidden = false
            //MARK: - oldPriceLabel constraints
            container.addSubview(oldPriceLabel)
            NSLayoutConstraint.activate([
                oldPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
                oldPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4)
            ])
            
            NSLayoutConstraint.activate([
                priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
                priceLabel.bottomAnchor.constraint(equalTo: oldPriceLabel.topAnchor, constant: 4),
                countImageView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 2),
                countImageView.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 2),
                countImageView.widthAnchor.constraint(equalToConstant: 23),
                countImageView.heightAnchor.constraint(equalToConstant: 23)
            ])
            let attributedString = NSAttributedString(string: String(format: "%.2f", oldPrice), attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            oldPriceLabel.attributedText = attributedString
            discountLabel.text = "\(discount)%"
        } else {
            container.addSubview(priceLabel)
            container.addSubview(countImageView)
            oldPriceLabel.isHidden = true
            discountLabel.isHidden = true
            NSLayoutConstraint.activate([
                priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
                countImageView.topAnchor.constraint(equalTo: priceLabel.topAnchor),
                countImageView.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 2),
                countImageView.widthAnchor.constraint(equalToConstant: 23),
                countImageView.heightAnchor.constraint(equalToConstant: 23)
            ])
        }
        countImageView.image = UIImage(named: weightPhoto)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
