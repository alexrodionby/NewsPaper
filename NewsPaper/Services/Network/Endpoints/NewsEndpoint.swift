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
    case findByWord(searchWord: String)
    
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
        case .findByWord(_):
            return "/v2/everything"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getTopHeadlines:
            return  [URLQueryItem(name: "country", value: "us"),
                     URLQueryItem(name: "apiKey", value: apiKey)]
            
        case .findByWord(searchWord: let searchWord):
            return  [URLQueryItem(name: "q", value: searchWord),
                     URLQueryItem(name: "apiKey", value: apiKey)]
        }
    }
    
    var method: String {
        switch self {
        case .getTopHeadlines:
            return "GET"
        case .findByWord(searchWord: _):
            return "GET"
        }
    }
}
