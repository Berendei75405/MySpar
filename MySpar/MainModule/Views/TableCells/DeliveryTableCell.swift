//
//  DeliveryTableCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 13.08.2023.
//

import UIKit

protocol DeliveryTableCellDataSource: AnyObject {
    func fetchDeliveryPhoto(index: Int) -> UIImage
    func numberOfCell() -> Int
}

final class DeliveryTableCell: UITableViewCell {
    static let identifier = "DeliveryTableCell"
    weak var dataSource: DeliveryTableCellDataSource?
    
    //MARK: - collectionView
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        
        //регистрация яйчеек
        collection.register(DeliveryCollectionViewCell.self, forCellWithReuseIdentifier: DeliveryCollectionViewCell.identifier)
        
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
extension DeliveryTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //количество яйчеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //заполнение яйчеек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeliveryCollectionViewCell.identifier, for: indexPath) as? DeliveryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configurate(photo: dataSource?.fetchDeliveryPhoto(index: indexPath.row) ?? UIImage())
        
        return cell
    }
    
    
}

