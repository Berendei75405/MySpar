//
//  DiscountTableCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 13.08.2023.
//

import UIKit

protocol DiscountTableCellDataSource: AnyObject {
    func fetch(index: Int) -> UIImage
}

final class DiscountTableCell: UITableViewCell {
    static let identifier = "DiscountTableCell"
    
    weak var dataSource: DiscountTableCellDataSource?
    
    //MARK: - collectionView
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: contentView.bounds, collectionViewLayout: UICollectionViewLayout())
        
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        
        //регистрация яйчеек
        collection.register(DiscountCollectionViewCell.self, forCellWithReuseIdentifier: DiscountCollectionViewCell.identifier)
        
        collection.dataSource = self
        collection.delegate = self
        
        contentView.addSubview(collection)
        
        return collection
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - extension
extension DiscountTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //количество яйчеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    //заполнение яйчеек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.identifier, for: indexPath) as? DiscountCollectionViewCell else { return UICollectionViewCell() }
        
        cell.confugurate(photo: dataSource?.fetch(index: indexPath.row) ?? UIImage())
        
        return cell
    }
    
    
}

