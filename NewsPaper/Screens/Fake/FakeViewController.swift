//
//  FakeViewController.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 6.05.23.
//

import UIKit

class FakeViewController: UIViewController {
    
    var newsAll: News?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
//        Task {
//            do {
//                newsAll = try await NewsService.shared.topHeadlines()
//                printArticle((newsAll?.articles)!)
//            } catch {
//                print("Error =", error.localizedDescription)
//            }
//        }
        
        Task {
            do {
                newsAll = try await NewsService.shared.search(word: "bitcoin")
                printArticle((newsAll?.articles)!)
            } catch {
                print("Error =", error.localizedDescription)
            }
        }
       
    }
    
    func printArticle(_ art: [Article]) {
        for i in art {
            print(i.title ?? "")
        }
    }
}