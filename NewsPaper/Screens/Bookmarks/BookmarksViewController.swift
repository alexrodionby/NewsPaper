//
//  BookmarksViewController.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 7.05.23.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    var articleForFavoriteCategories: [Article] = []
    var favoritCategories = ["sports", "technology"]
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Saved articles to the library"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableCell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func addviewLayout() {
        view.addSubview(descriptionLabel)
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            mainTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Task {
            do {
                articleForFavoriteCategories = try await NewsService.shared.searchCategories(categories: favoritCategories).articles ?? []
                mainTableView.reloadData()
            } catch {
                print("Error =", error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        view.backgroundColor = .white
        
        addviewLayout()
        
        self.title = "Bookmarks"
        // Create large title font
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
            NSAttributedString.Key.paragraphStyle: {
                let style = NSMutableParagraphStyle()
                style.firstLineHeadIndent = 0.0
                return style
            }()
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
    
    }
}

extension BookmarksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleForFavoriteCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell", for: indexPath) as! MainTableViewCell
        let article = articleForFavoriteCategories[indexPath.item]
        cell.configureCell(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = articleForFavoriteCategories[indexPath.row]
        print("Нажали на ячейку таблицы =", selectedArticle)
        let article = articleForFavoriteCategories[indexPath.item]
        let vc = DetailNewsViewController()
        vc.article = article
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
