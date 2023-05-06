//
//  NewsEndpoint.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 6.05.23.
//

import Foundation

let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String
let allCategory = ["business", "entertainment", "general", "health", "science", "sports", "technology"]

enum NewsEndpoint: Endpoint {
    
    case getTopHeadlines
    case searchByWord(searchWord: String)
    case searchByCategory(searchCategory: String)
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseUrl: String {
        switch self {
        default:
            return "newsapi.org"
        }
    }
    
    var path: String {
        switch self {
        case .getTopHeadlines:
            return "/v2/top-headlines"
        case .searchByWord(_):
            return "/v2/everything"
        case .searchByCategory(searchCategory: _):
            return "/v2/top-headlines"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getTopHeadlines:
            return  [URLQueryItem(name: "country", value: "us"),
                     URLQueryItem(name: "apiKey", value: apiKey)]
            
        case .searchByWord(searchWord: let searchWord):
            return  [URLQueryItem(name: "q", value: searchWord),
                     URLQueryItem(name: "apiKey", value: apiKey)]
        case .searchByCategory(searchCategory: let searchCategory):
            return  [URLQueryItem(name: "country", value: "us"),
                     URLQueryItem(name: "category", value: searchCategory),
                     URLQueryItem(name: "apiKey", value: apiKey)]
        }
    }
    
    var method: String {
        switch self {
        case .getTopHeadlines, .searchByCategory(searchCategory: _), .searchByWord(searchWord: _):
            return "GET"
        }
    }
}
