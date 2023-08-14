//
//  ViewController.swift
//  MySpar
//
//  Created by Новгородцев Никита on 13.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var discountArray = [UIImage(named: "discount1") ?? UIImage(), UIImage(named: "discount2") ?? UIImage(), UIImage(named: "discount3") ?? UIImage(), UIImage(named: "discount4") ?? UIImage()]
    
    private let deliveryArray = [UIImage(named: "delivery1") ?? UIImage(), UIImage(named: "delivery2") ?? UIImage(), UIImage(named: "delivery3") ?? UIImage(), UIImage(named: "delivery4") ?? UIImage()]
    
    private var recommendedProducts = [Product(photo: "RecommendedProduct1", price: 109.90, oldPrice: 129.90, category: "Удар по ценам", discount: 15, weightPhoto: "ршт"), Product(photo: "RecommendedProduct2", price: 279.90, oldPrice: 0, category: "Новинка", discount: 0, weightPhoto: "ршт"), Product(photo: "RecommendedProduct3", price: 119.99, oldPrice: 169.99, category: "Цена по карте", discount: 29, weightPhoto: "р100"), Product(photo: "RecommendedProduct4", price: 43.90, oldPrice: 0, category: "", discount: 0, weightPhoto: "р100"), Product(photo: "RecommendedProduct5", price: 999.90, oldPrice: 1299.90, category: "Удар по ценам", discount: 23 , weightPhoto: "р100")]
    
    private var sweetProducts = [Product(photo: "sweet1", price: 79.90, oldPrice: 0, category: "Новинка", discount: 0, weightPhoto: "ршт"), Product(photo: "sweet2", price: 319.90, oldPrice: 0, category: "", discount: 0, weightPhoto: "ршт"), Product(photo: "sweet3", price: 99.90, oldPrice: 0, category: "", discount: 0, weightPhoto: "ршт"), Product(photo: "sweet4", price: 239.90, oldPrice: 0, category: "Новинка", discount: 0, weightPhoto: "ршт")]
    
    //MARK: - mainTableView
    private lazy var mainTableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .plain)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        
        //регистрация яйчеек
        table.register(StoriesTableCell.self,
                       forCellReuseIdentifier: StoriesTableCell.identifier)
        
        table.register(DiscountTableCell.self,
                       forCellReuseIdentifier: DiscountTableCell.identifier)
        
        table.register(PointsTableCell.self,
                       forCellReuseIdentifier: PointsTableCell.identifier)
        
        table.register(DeliveryTableCell.self,
                       forCellReuseIdentifier: DeliveryTableCell.identifier)
        
        table.register(RecommendedProductsTableCell.self, forCellReuseIdentifier: RecommendedProductsTableCell.identifier)
        
        table.register(SweetTableCell.self, forCellReuseIdentifier: SweetTableCell.identifier)
        
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
        setNavigationBar()
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
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(120))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
    
                return section
            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(120))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
                section.interGroupSpacing = 8
    
                return section
            case 4:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(160))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70))
                let header: NSCollectionLayoutBoundarySupplementaryItem = .init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [header]
                section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
                section.interGroupSpacing = 8
    
                return section
            case 5:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(160))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20))
                let header: NSCollectionLayoutBoundarySupplementaryItem = .init(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [header]
                section.contentInsets = .init(top: 8, leading: 16, bottom: 0, trailing: 16)
                section.interGroupSpacing = 8
    
                return section
            default:
                return NSCollectionLayoutSection(group: NSCollectionLayoutGroup(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(.zero), heightDimension: .absolute(.zero))))
            }
        }
    }
    
    //MARK: - setNavigationBar
    private func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let view = UIView()
        view.frame = CGRect(x: .zero, y: .zero, width: self.view.frame.width, height: 44)
        view.clipsToBounds = true
        
        let searchButton: UIButton = {
            let but = UIButton(type: .system)
            but.frame = CGRect(x: .zero, y: .zero, width: self.view.frame.width/1.23, height: 38)
            but.backgroundColor = .white
            but.setTitle("Москва, Москва и Московская область", for: .normal)
            but.titleLabel?.font = .systemFont(ofSize: 13.5)
            but.setTitleColor(.black, for: .normal)
            but.layer.cornerRadius = but.frame.size.height/2
            but.layer.borderWidth = 1
            but.layer.borderColor = UIColor.gray.cgColor
            
            return but
        }()
        
        let locationImageView: UIImageView = {
            let img = UIImageView(frame: CGRect(x: 6, y: 3, width: 20, height: 30))
            img.image = UIImage(named: "location")
            img.contentMode = .scaleAspectFit
            
            return img
        }()
        
        let editorButton: UIButton = {
            let but = UIButton()
            but.backgroundColor = #colorLiteral(red: 0.6992026567, green: 0.6992026567, blue: 0.6992026567, alpha: 1)
            but.setImage(UIImage(named: "menu"), for: .normal)
            but.layer.cornerRadius = 10
            
            return but
        }()
        view.addSubview(searchButton)
        
        editorButton.frame = CGRect(x: self.view.frame.width - 60, y: 10, width: 28, height: 21)
        
        view.addSubview(editorButton)
        view.addSubview(locationImageView)
        
        navigationItem.titleView = view
    }

}

//MARK: - extensions
extension MainViewController: UITableViewDataSource,
                              UITableViewDelegate, DiscountTableCellDataSource,
                              DeliveryTableCellDataSource, RecommendedProductsTableCellDataSource, SweetTableCellTableCellDataSource {
    
    //количество яйчеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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
            
            cell.collectionView.scrollToItem(at: IndexPath(row: 29, section: 0), at: .centeredHorizontally, animated: false)
            
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
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedProductsTableCell.identifier, for: indexPath) as?  RecommendedProductsTableCell else { return UITableViewCell() }
            
            cell.collectionView.collectionViewLayout = createLayout(index: indexPath.row)
            
            cell.dataSource = self
            
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SweetTableCell.identifier, for: indexPath) as?  SweetTableCell else { return UITableViewCell() }
            
            cell.collectionView.collectionViewLayout = createLayout(index: indexPath.row)
            
            cell.textForHeader = "Сладкое настроение"
            
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
            return 120
        case 3:
            return 148
        case 4:
            return 176 + 70
        case 5:
            return 176 + 70
        default:
            return .zero
        }
    }
    
    //DiscountTableCellDataSource
    func fetch(index: Int) -> UIImage {
        if discountArray.count == 4 {
            var newArray: [UIImage] = []
            for _ in 1...15 {
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
    
    //RecommendedProductsTableCellDataSource
    func fetchRecommendedProduct(index: Int) -> Product {
        return recommendedProducts[index]
    }
    
    //SweetTableCellTableCellDataSource
    func fetchSweetProduct(index: Int) -> Product {
        return sweetProducts[index]
    }
    
}

