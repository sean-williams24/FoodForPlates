//
//  ArticlesModel.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 04/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation


struct Article {
    let title: String
    let venue: String
    let info: String

    init(dictionary: [String : String]) {
        self.title = dictionary["Title"]!
        self.venue = dictionary["Venue"]!
        self.info = dictionary["Info"]!
    }
}

//MARK: - All Articles

extension Article {

    
    
    static var allArticles: [Article]! {

        var articlesArray = [Article]()
        
        for article in articleData() {
            articlesArray.append(Article(dictionary: article))
        }
        return articlesArray
    }
    

    
    static func articleData() -> [[String : String]] {

        return [
            ["Title" : "The Best Roasts In East London", "Venue" : "SMOKESTAK", "Info" : BestRoastsInEastLondon.SmokestakRoast.rawValue],
            ["Title" : "The Best Roasts In East London", "Venue" : "Goodhood", "Info" : BestRoastsInEastLondon.GoodhoodRoast.rawValue],
            ["Title" : "The Best Roasts In East London", "Venue" : "NT's", "Info" : BestRoastsInEastLondon.NTs.rawValue],
            
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "SMOKESTAK", "Info" : OurFavouriteBreakfastsInEastLondon.SmokestakRoast.rawValue],
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "Goodhood", "Info" : OurFavouriteBreakfastsInEastLondon.GoodhoodRoast.rawValue],
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "NT's", "Info" : OurFavouriteBreakfastsInEastLondon.NTs.rawValue]
        ]
    }

}




// DUMMY DATA

enum BestRoastsInEastLondon: String {
    case SmokestakRoast = "REALLY good roasts"
    case GoodhoodRoast = "Also lovely Beef"
    case NTs = "OH my goodness the beef is divine"
}

enum OurFavouriteBreakfastsInEastLondon: String {
    case SmokestakRoast = "REALLY good roasts"
    case GoodhoodRoast = "Also lovely Beef"
    case NTs = "OH my goodness the beef is divine"
}
