//
//  TabBarController.swift
//  MySpar
//
//  Created by Новгородцев Никита on 15.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    //MARK: - homeImageView
    private let homeImageView: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "stories")
        
        return img
    }()
    
    //MARK: - catalogImageView
    private let catalogImageView: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "category")
        img.tintColor = .white
        
        return img
    }()
    
    //MARK: - shopImageView
    private let shopImageView: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "shop")
        img.tintColor = .white
        
        return img
    }()
    
    //MARK: - personImageView
    private let personImageView: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "user")
        img.tintColor = .white
        
        return img
    }()
    
    //MARK: - photoStackView
    private lazy var photoStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [homeImageView, catalogImageView, shopImageView, personImageView])
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.alignment = .center
        //stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    //MARK: - homeLabel
    private let homeLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "Главная"
        lab.font = .systemFont(ofSize: 10)
        lab.textAlignment = .left
        lab.textColor = .gray
        
        return lab
    }()
    
    //MARK: - catalogLabel
    private let catalogLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "Каталог"
        lab.textColor = .gray
        lab.textAlignment = .center
        lab.font = .systemFont(ofSize: 10)
        
        return lab
    }()
    
    //MARK: - shopLabel
    private let shopLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "Корзина"
        lab.textColor = .gray
        lab.font = .systemFont(ofSize: 10)
        lab.textAlignment = .right
        
        return lab
    }()
    
    //MARK: - personLabel
    private let personLabel: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "Профиль"
        lab.textColor = .gray
        lab.textAlignment = .center
        lab.font = .systemFont(ofSize: 10)
        
        return lab
    }()
    
    //MARK: - textStackView
    private lazy var textStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [homeLabel, catalogLabel, shopLabel, personLabel])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        //stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        constraints()
    }
    
    //MARK: - constraints
    private func constraints() {
        self.tabBar.addSubview(photoStackView)
        
        NSLayoutConstraint.activate([
            photoStackView.topAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: -8),
            photoStackView.leadingAnchor.constraint(equalTo: self.tabBar.leadingAnchor, constant: 32),
            photoStackView.trailingAnchor.constraint(equalTo: self.tabBar.trailingAnchor, constant: -32),
            
            homeImageView.widthAnchor.constraint(equalToConstant: 50),
            homeImageView.heightAnchor.constraint(equalToConstant: 50),
            
            catalogImageView.widthAnchor.constraint(equalToConstant: 25),
            catalogImageView.heightAnchor.constraint(equalToConstant: 25),
            
            shopImageView.widthAnchor.constraint(equalToConstant: 25),
            shopImageView.heightAnchor.constraint(equalToConstant: 25),
            
            personImageView.widthAnchor.constraint(equalToConstant: 25),
            personImageView.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        self.tabBar.addSubview(textStackView)
        NSLayoutConstraint.activate([
            textStackView.topAnchor.constraint(equalTo: photoStackView.bottomAnchor, constant: -4),
            textStackView.leadingAnchor.constraint(equalTo: self.tabBar.leadingAnchor, constant: 36),
            textStackView.trailingAnchor.constraint(equalTo: self.tabBar.trailingAnchor, constant: -20),
            
            homeLabel.widthAnchor.constraint(equalToConstant: 50),
            catalogLabel.widthAnchor.constraint(equalToConstant: 40),
            shopLabel.widthAnchor.constraint(equalToConstant: 50),
            personLabel.widthAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
}

