//
//  NewsModel.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 6.05.23.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let favorites: Bool? // Добавил параметр для добавления статьи в избранное
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
