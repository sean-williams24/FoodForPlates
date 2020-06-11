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
    
    static let articleTitles = ["THE BEST \nSUNDAY \nROASTS IN \nEAST LONDON",
                    "OUR \nFAVOURITE \nEAST LONDON \nBREAKFASTS",
                    "EAST LONDON \nBREWERIES \nAND \nTAPROOMS",
                    "BEST PIZZA IN \nEAST LONDON"]
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
            ["Title" : "The Best Sunday Roasts In East London", "Venue" : "SMOKESTAK", "Info" : BestRoastsInEastLondon.Smokestak.rawValue],
            ["Title" : "The Best Sunday Roasts In East London", "Venue" : "The Marksman", "Info" : BestRoastsInEastLondon.TheMarksman.rawValue],
            ["Title" : "The Best Sunday Roasts In East London", "Venue" : "Lord Morpeth", "Info" : BestRoastsInEastLondon.LordMorpeth.rawValue],
            
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "Bistrotheque", "Info" : OurFavouriteBreakfastsInEastLondon.Bistrotheque.rawValue],
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "Rusty Bike", "Info" : OurFavouriteBreakfastsInEastLondon.RustyBike.rawValue],
            ["Title" : "Our Favourite East London Breakfasts", "Venue" : "NT's", "Info" : OurFavouriteBreakfastsInEastLondon.NTs.rawValue],
            
            ["Title" : "East London Breweries And Taprooms", "Venue" : "Beer Merchants Tap", "Info" : EastLondonBreweriesAndTaprooms.BeerMerchantsTap.rawValue],
            ["Title" : "East London Breweries And Taprooms", "Venue" : "Howling Hops Brewery & Tank Bar", "Info" : EastLondonBreweriesAndTaprooms.HowlingHops.rawValue],
            ["Title" : "East London Breweries And Taprooms", "Venue" : "East London Liquor Company", "Info" : EastLondonBreweriesAndTaprooms.EastLondonLiquor.rawValue],
            
            ["Title" : "Best Pizza In East London", "Venue" : "El Ganso Cafe", "Info" : BestPizzaInEastLondon.ElGanso.rawValue],
            ["Title" : "Best Pizza In East London", "Venue" : "CRATE Brewery", "Info" : BestPizzaInEastLondon.Crate.rawValue],
            ["Title" : "Best Pizza In East London", "Venue" : "SMOKESTAK", "Info" : BestPizzaInEastLondon.Smokestak.rawValue]
        ]
    }

}



