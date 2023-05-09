//
//  BrowseViewController.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 7.05.23.
//

import UIKit
import SnapKit

class BrowseViewController: UIViewController, UISearchBarDelegate {
    
    let allCategory = ["random", "business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        return view
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover things of this world"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.allowsSelection = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let searchBarView = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarView.delegate = self
        searchBarView.placeholder = "Search"
        searchBarView.backgroundImage = UIImage()
        
        setupView()
        setupConstraints()
        setupCollectionView()
        
        title = "Browse"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func setupCollectionView() {
        view.addSubview(categoryCollectionView)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
        //          NSLayoutConstraint.activate([
        //              pillsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
        //              pillsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //              pillsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        //              pillsCollectionView.heightAnchor.constraint(equalToConstant: 50) // Установите желаемую высоту коллекции
        //          ])
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        view.addSubview(mainLabel)
        view.addSubview(searchBarView)
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.top.left.bottom.right.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(145)
        }
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            // Выполните действия, связанные с поиском, на основе введенного текста
            print("Выполняется поиск: \(searchText)")
            searchBar.resignFirstResponder()
        }
    }
}

extension BrowseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = allCategory[indexPath.item]
        print("Нажали на категорию =", selectedCategory)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        let category = allCategory[indexPath.item]
        cell.configureCell(title: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = allCategory[indexPath.row]
        let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize: 14.0)]).width + 40.0
     //   collectionView.collectionViewLayout.invalidateLayout()
        return CGSize(width: cellWidth, height: 50)
    }
    
    
}
