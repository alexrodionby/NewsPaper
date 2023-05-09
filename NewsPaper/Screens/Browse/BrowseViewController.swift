//
//  BrowseViewController.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 7.05.23.
//

import UIKit
import SnapKit

class BrowseViewController: UIViewController, UISearchBarDelegate {
    
    let allCategory = ["Random", "Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemGray3
        view.showsVerticalScrollIndicator = false
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let firstIndexPath = IndexPath(item: 0, section: 0)
        categoryCollectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: [])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarView.delegate = self
        searchBarView.placeholder = "Search"
        searchBarView.backgroundImage = UIImage()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        setupView()
        setupConstraints()
        
        title = "Browse"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        view.addSubview(searchBarView)
        view.addSubview(scrollView)
        view.addSubview(categoryCollectionView)
    }
    
    private func setupConstraints() {
        
        mainLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(17)
            $0.top.equalToSuperview().offset(145)
        }
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
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
        let cellWidth = text.size(withAttributes:[.font: UIFont.systemFont(ofSize: 14.0)]).width + 30.0
        return CGSize(width: cellWidth, height: 40)
    }
}
