
//  CategoriesViewController.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 7.05.23.


import UIKit

class CategoriesViewController: UIViewController {
    
    var categoriesView: CategoriesView
    var categories = [CategoryModel(name: "🏈   Sports", isSelected: false), CategoryModel(name: "🎮   Gaming", isSelected: false), CategoryModel(name: "⚖️   Politics", isSelected: false), CategoryModel(name: "🎨   Art", isSelected: false), CategoryModel(name: "📜   History", isSelected: false), CategoryModel(name: "👗   Fashion", isSelected: false), CategoryModel(name: "🐻   Animals", isSelected: false), CategoryModel(name: "🍔   Food", isSelected: false)]
    
    init(isOnboarding: Bool, header: String, info: String) {
        categoriesView = CategoriesView(isOnboarding: isOnboarding, header: header, info: info)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view = categoriesView
        let stack = CategoryStackView()
        for category in categories {
            let button = CategoryButton(category: category)
            stack.addSubview(categoryButton: button)
        }
        categoriesView.setUIElements(stack: stack)
        
        super.viewDidLoad()
    }
}
