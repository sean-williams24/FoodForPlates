//
//  VenuesModel.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 25/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation
import UIKit

enum Area: String {
    case Shoreditch = "Shoreditch & Hoxton"
    case BethnalGreen = "Bethnal Green"
    case LondonFields = "London Fields & Hackney Central"
    case HackneyWick = "Hackney Wick"
    case Bow = "Bow & Mile End"
}

struct Venue {
    
    // MARK: Properties
    
    let name: String
    let area: String
    let category: String
//    let image: UIImage?
//    let description: String
//    let website: URL?
//    let instagram: String
//    let menu: Menu
    
    static let NameKey = "NameKey"
    static let AreaKey = "AreaKey"
    static let CategoryKey = "CategoryKey"

    
    
    // MARK: Initializer
    
    init(dictionary: [String : String]) {
        self.name = dictionary[Venue.NameKey]!
        self.area = dictionary[Venue.AreaKey]!
        self.category = dictionary[Venue.CategoryKey]!
    }
    
}

struct Menu {
    let starters: String
    let mains: String
    let desserts: String
}



// MARK: All Venues

extension Venue {
    
    static var allVenues: [Venue]! {
        
        var venuesArray = [Venue]()
        
        for venue in venueData() {
            venuesArray.append(Venue(dictionary: venue))
        }
        
        return venuesArray
    }
    
    
    static func venueData() -> [[String : String]] {
        return [
            [Venue.NameKey : "SMOKESTAK", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Food"],
            [Venue.NameKey : "Dishoom", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Food"],
            [Venue.NameKey : "Well & Bucket", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Drinks"],
            [Venue.NameKey : "Shoreditch Grind", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Coffee"],
            [Venue.NameKey : "Goodhood", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Shopping"],
            [Venue.NameKey : "Brick Lane Market", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Markets"],
            [Venue.NameKey : "The Marksman", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Food"],
            [Venue.NameKey : "Bistrotheque", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Food"],
            [Venue.NameKey : "Satan’s Whiskers", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Drinks"],
            [Venue.NameKey : "The Royal Oak", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Drinks"],
            [Venue.NameKey : "Conservatory Archives", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Shopping"],
        ]
    }
    
}



