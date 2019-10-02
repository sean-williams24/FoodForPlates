//
//  VenuesModel.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 25/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation
import UIKit


struct Venue {
    
    // MARK: Properties
    
    let name: String
    let area: String
    let category: String
    let description: String?
    let address: String?
    let openingTimes: String?
    let book: String?
    let phone: String?
//    let menu: Menu
    
    static let NameKey = "NameKey"
    static let AreaKey = "AreaKey"
    static let CategoryKey = "CategoryKey"
    static let DescritptionKey = "DescriptionKey"
    static let AddressKey = "AddressKey"
    static let OpeningTimesKey = "OpeningTimesKey"
    static let BookKey = "BookKey"
    static let PhoneKey = "PhoneKey"
    
    
    // MARK: Initializer
    
    init(dictionary: [String : String]) {
        self.name = dictionary[Venue.NameKey]!
        self.area = dictionary[Venue.AreaKey]!
        self.category = dictionary[Venue.CategoryKey]!
        self.description = dictionary[Venue.DescritptionKey]
        self.address = dictionary[Venue.AddressKey]
        self.openingTimes = dictionary[Venue.OpeningTimesKey]
        self.book = dictionary[Venue.BookKey]
        self.phone = dictionary[Venue.PhoneKey]
    }
    
}

enum Area: String {
    case Shoreditch = "Shoreditch & Hoxton"
    case BethnalGreen = "Bethnal Green"
    case LondonFields = "London Fields & Hackney Central"
    case HackneyWick = "Hackney Wick"
    case Bow = "Bow & Mile End"
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
            
            // Shoreditch & Hoxton
            
            [Venue.NameKey : "SMOKESTAK", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.Smokestak.rawValue, Venue.AddressKey : Address.Smokestak.rawValue, Venue.OpeningTimesKey : OpeningTimes.Smokestak.rawValue, Venue.BookKey : Email.Smokestak.rawValue, Venue.PhoneKey : Telephone.Smokestak.rawValue],
            [Venue.NameKey : "Dishoom", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.Dishoom.rawValue, Venue.AddressKey : Address.Dishoom.rawValue, Venue.OpeningTimesKey : OpeningTimes.Dishoom.rawValue, Venue.BookKey : Email.Dishoom.rawValue, Venue.PhoneKey : Telephone.Dishoom.rawValue],
            [Venue.NameKey : "Well & Bucket", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.WellAndBucket.rawValue, Venue.AddressKey : Address.WellAndBucket.rawValue, Venue.OpeningTimesKey : OpeningTimes.WellAndBucket.rawValue, Venue.BookKey : Email.WellAndBucket.rawValue, Venue.PhoneKey : Telephone.WellAndBucket.rawValue],
            [Venue.NameKey : "Shoreditch Grind", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Coffee", Venue.DescritptionKey : Description.ShoreditchGrind.rawValue, Venue.AddressKey : Address.ShoreditchGrind.rawValue, Venue.OpeningTimesKey : OpeningTimes.ShoreditchGrind.rawValue, Venue.BookKey : Email.ShoreditchGrind.rawValue, Venue.PhoneKey : Telephone.ShoreditchGrind.rawValue],
            [Venue.NameKey : "Goodhood", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Shopping", Venue.DescritptionKey : Description.Goodhood.rawValue, Venue.AddressKey : Address.Goodhood.rawValue, Venue.OpeningTimesKey : OpeningTimes.Goodhood.rawValue, Venue.BookKey : Email.Goodhood.rawValue, Venue.PhoneKey : Telephone.Goodhood.rawValue],
            [Venue.NameKey : "Brick Lane Market", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Markets", Venue.DescritptionKey : Description.BricklaneMarket.rawValue, Venue.AddressKey : Address.BricklaneMarket.rawValue, Venue.OpeningTimesKey : OpeningTimes.BricklaneMarket.rawValue, Venue.BookKey : Email.BricklaneMarket.rawValue, Venue.PhoneKey : Telephone.BricklaneMarket.rawValue],
            
            // Bethnal Green
            
//            [Venue.NameKey : "The Marksman", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.TheMarksman.rawValue],
//            [Venue.NameKey : "Bistrotheque", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.Bistrotheque.rawValue],
//            [Venue.NameKey : "Satan’s Whiskers", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Drinks"],
//            [Venue.NameKey : "The Royal Oak", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Drinks"],
//            [Venue.NameKey : "Conservatory Archives", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Shopping"],
        ]
    }
    
}



