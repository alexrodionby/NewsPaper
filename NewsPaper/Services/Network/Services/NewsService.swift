//
//  NewsService.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 6.05.23.
//

import Foundation

final class NewsService {
    
    private init() {}
    static let shared = NewsService()
    
    func topHeadlines() async throws -> News {
        do {
            let response = try await HTTPClient().request(endpoint: NewsEndpoint.getTopHeadlines, responseModel: News.self)
            return response
        } catch {
            print(error)
            throw error
        }
    }
    
    func searchWord(word: String) async throws -> News {
        do {
            let response = try await HTTPClient().request(endpoint: NewsEndpoint.searchByWord(searchWord: word), responseModel: News.self)
            return response
        } catch {
            print(error)
            throw error
        }
    }
    
    func searchCategory(category: String) async throws -> News {
        do {
            let response = try await HTTPClient().request(endpoint: NewsEndpoint.searchByCategory(searchCategory: category), responseModel: News.self)
            return response
        } catch {
            print(error)
            throw error
        }
    }
    
}
