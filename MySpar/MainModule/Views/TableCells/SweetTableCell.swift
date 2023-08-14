//
//  SweetTableCell.swift
//  MySpar
//
//  Created by Новгородцев Никита on 14.08.2023.
//

import UIKit

protocol SweetTableCellTableCellDataSource: AnyObject {
    func fetchSweetProduct(index: Int) -> Product
}

class SweetTableCell: UITableViewCell {
    static let identifier = "SweetTableCell"
    var textForHeader = "Сладкое настроение"
    weak var dataSource: SweetTableCellTableCellDataSource?
    
    //MARK: - collectionView
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        
        //регистрация яйчеек
        collection.register(RecommendedProductsCollectionCell.self, forCellWithReuseIdentifier: RecommendedProductsCollectionCell.identifier)
        
        //регистрация headers
        collection.register(RecommendedProductsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendedProductsHeaderCell.identifier)
        
        collection.dataSource = self
        collection.delegate = self
        
        contentView.addSubview(collection)
        
        return collection
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -20),
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
extension SweetTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //количество яйчеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //заполнение яйчеек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedProductsCollectionCell.identifier, for: indexPath) as? RecommendedProductsCollectionCell else { return UICollectionViewCell() }
        
        let product = dataSource?.fetchSweetProduct(index: indexPath.row)
        
        cell.configurate(photo: product?.photo ?? "", price: product!.price, oldPrice: product!.oldPrice, category: product!.category, discount: product!.discount, weightPhoto: product!.weightPhoto)

        return cell
    }
    
    //добавление заголовка
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.row {
        case .zero:
            guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendedProductsHeaderCell.identifier, for: indexPath) as? RecommendedProductsHeaderCell else { return UICollectionReusableView() }
            
            cell.configurate(title: textForHeader)
            
            return cell
        default:
            return UICollectionReusableView()
        }
    }
    
    
}
