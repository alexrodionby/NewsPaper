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
    
    func search(word: String) async throws -> News {
        do {
            let response = try await HTTPClient().request(endpoint: NewsEndpoint.findByWord(searchWord: word), responseModel: News.self)
            return response
        } catch {
            print(error)
            throw error
        }
    }
}
