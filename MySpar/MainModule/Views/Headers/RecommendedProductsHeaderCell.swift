//
//  RecommendedProductsHeaderCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 14.08.2023.
//

import UIKit

final class RecommendedProductsHeaderCell: UICollectionReusableView {
    static let identifier = "SkillsSectionHeader"
    
    //MARK: - titleLabel
    private let titleLabel: UILabel = {
        var lab = UILabel()
        lab.textColor = .black
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        lab.translatesAutoresizingMaskIntoConstraints = false
        
        return lab
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupConstraints
    private func setupConstraints() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configurate(title: String) {
        self.titleLabel.text = title
    }
}
