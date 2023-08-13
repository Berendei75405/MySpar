//
//  ViewController.swift
//  MySpar
//
//  Created by Новгородцев Никита on 13.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var discountArray: [UIImage] = [UIImage(named: "discount1") ?? UIImage(), UIImage(named: "discount2") ?? UIImage(), UIImage(named: "discount3") ?? UIImage(), UIImage(named: "discount4") ?? UIImage()]
    
    let deliveryArray: [UIImage] = [UIImage(named: "delivery1") ?? UIImage(), UIImage(named: "delivery2") ?? UIImage(), UIImage(named: "delivery3") ?? UIImage(), UIImage(named: "delivery4") ?? UIImage()]
    
    //MARK: - mainTableView
    private lazy var mainTableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .plain)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        
        //регистрация яйчеек
        table.register(StoriesTableCell.self, forCellReuseIdentifier: StoriesTableCell.identifier)
        
        table.register(DiscountTableCell.self, forCellReuseIdentifier: DiscountTableCell.identifier)
        
        table.register(PointsTableCell.self, forCellReuseIdentifier: PointsTableCell.identifier)
        
        table.register(DeliveryTableCell.self, forCellReuseIdentifier: DeliveryTableCell.identifier)
        
        table.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        table.dataSource = self
        table.delegate = self
        
        view.addSubview(table)
        
        return table
    }()

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    //MARK: - setConstraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    //MARK: - createLayout
    private func createLayout(index: Int) -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { _, _ in
            switch index {
            case .zero:
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(90), heightDimension: .absolute(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 8, leading: 16, bottom: 0, trailing: 16)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(400), heightDimension: .absolute(100))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
    
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.15), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 16, leading: 8, bottom: 0, trailing: 8)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(200))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
    
                return section
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.3), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(150))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
    
                return section
            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(150))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
                section.interGroupSpacing = 8
    
                return section
            default:
                return NSCollectionLayoutSection(group: NSCollectionLayoutGroup(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(.zero), heightDimension: .absolute(.zero))))
            }
        }
    }

}

//MARK: - extensions
extension MainViewController: UITableViewDataSource,
                              UITableViewDelegate, DiscountTableCellDataSource,
                              DeliveryTableCellDataSource {
    
    //количество яйчеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //заполнение яйчеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case .zero:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableCell.identifier) as? StoriesTableCell else { return UITableViewCell() }
            
            cell.collectionView.collectionViewLayout = createLayout(index: indexPath.row)
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTableCell.identifier) as? DiscountTableCell else { return UITableViewCell() }
            
            cell.collectionView.collectionViewLayout = createLayout(index: indexPath.row)
            
            cell.dataSource = self
            
            cell.collectionView.scrollToItem(at: IndexPath(row: 99, section: 0), at: .centeredHorizontally, animated: false)
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PointsTableCell.identifier) as? PointsTableCell else { return UITableViewCell() }
            
            cell.collectionView.collectionViewLayout = createLayout(index: indexPath.row)
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryTableCell.identifier, for: indexPath) as?  DeliveryTableCell else { return UITableViewCell() }
            
            cell.collectionView.collectionViewLayout = createLayout(index: indexPath.row)
            
            cell.dataSource = self
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    //высота яйчеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case .zero:
            return 100
        case 1:
            return 200
        case 2:
            return 150
        case 3:
            return 168
        default:
            return .zero
        }
    }
    
    //DiscountTableCellDataSource
    func fetch(index: Int) -> UIImage {
        if discountArray.count == 4 {
            var newArray: [UIImage] = []
            for _ in 1...50 {
                newArray.append(contentsOf: discountArray)
            }
            discountArray = newArray
        }
        
        return discountArray[index]
    }
    
    //DeliveryTableCellDataSource
    func fetchDeliveryPhoto(index: Int) -> UIImage {
        return deliveryArray[index]
    }
    
    func numberOfCell() -> Int {
        return deliveryArray.count
    }
    
}

