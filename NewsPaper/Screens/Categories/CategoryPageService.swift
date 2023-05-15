//
//  CategoryPageService.swift
//  NewsPaper
//
//  Created by Sofya Olekhnovich on 11.05.2023.
//

 struct CategoryPageService {
     static func getContent(isOnboarding: Bool) -> (header: String, info: String) {
         return isOnboarding ?
         (header: "Select your favorite topics", info: "Select some of your favorite topics to let us suggest better news for you.") :
         (header: "Categories", info: "Thousands of articles in each category")
     }
}
