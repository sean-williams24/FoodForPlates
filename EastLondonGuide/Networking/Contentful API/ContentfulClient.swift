//
//  Contentful API.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 11/09/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import Contentful
import Foundation

class ContentfulClient {
    
    static let contentfulClient = Client(spaceId: Keys.spaceID, accessToken: Keys.contentfulAccessToken, contentTypeClasses: [ContentfulArticle.self, ArticleType.self])
    
    
    class func fetchArticleTypes(completion: @escaping ([ArticleTypeViewModel], Error?)->()) {
        
        let articleTypeQuery = QueryOn<ArticleType>.where(contentTypeId: "articleType")
        
        contentfulClient.fetchArray(of: ArticleType.self, matching: articleTypeQuery) { (result: Result<HomogeneousArrayResponse<ArticleType>>) in
            switch result {
            case .success(let entriesArrayResponse):
                let articleViewModels = entriesArrayResponse.items.map({ArticleTypeViewModel(article: $0)})
                completion(articleViewModels, nil)
                
            case .error(let error):
                completion([], error)
            }
        }
    }
    
    
    class func fetchArticles(completion: @escaping ([ArticleViewModel])->()) {

         let articleQuery = QueryOn<ContentfulArticle>.where(contentTypeId: "articles")
         
         contentfulClient.fetchArray(of: ContentfulArticle.self, matching: articleQuery) { (result: Result<HomogeneousArrayResponse<ContentfulArticle>>) in
             switch result {
             case .success(let entriesArrayResponse):
                let articleViewModels = entriesArrayResponse.items.map({ArticleViewModel(article: $0)})
                 completion(articleViewModels)
                
             case .error:
                completion([])
                
//                 DispatchQueue.main.async {
//                 self.showErrorAlert(title: "No inspiration at this time!", error: "Something went wrong whilst trying to download inspiration articles, please try reloading the application.")
//                     }
             }
         }
    }

}
