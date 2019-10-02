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
    let email: String?
    let phone: String?
//    let menu: Menu
    
    static let NameKey = "NameKey"
    static let AreaKey = "AreaKey"
    static let CategoryKey = "CategoryKey"
    static let DescritptionKey = "DescriptionKey"
    static let AddressKey = "AddressKey"
    static let OpeningTimesKey = "OpeningTimesKey"
    static let EmailKey = "BookKey"
    static let PhoneKey = "PhoneKey"
    
    
    // MARK: Initializer
    
    init(dictionary: [String : String]) {
        self.name = dictionary[Venue.NameKey]!
        self.area = dictionary[Venue.AreaKey]!
        self.category = dictionary[Venue.CategoryKey]!
        self.description = dictionary[Venue.DescritptionKey]
        self.address = dictionary[Venue.AddressKey]
        self.openingTimes = dictionary[Venue.OpeningTimesKey]
        self.email = dictionary[Venue.EmailKey]
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
            
            [Venue.NameKey : "SMOKESTAK", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.Smokestak.rawValue, Venue.AddressKey : Address.Smokestak.rawValue, Venue.OpeningTimesKey : OpeningTimes.Smokestak.rawValue, Venue.EmailKey : Email.Smokestak.rawValue, Venue.PhoneKey : Telephone.Smokestak.rawValue],
            [Venue.NameKey : "Dishoom", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.Dishoom.rawValue, Venue.AddressKey : Address.Dishoom.rawValue, Venue.OpeningTimesKey : OpeningTimes.Dishoom.rawValue, Venue.EmailKey : Email.Dishoom.rawValue, Venue.PhoneKey : Telephone.Dishoom.rawValue],
            [Venue.NameKey : "Well & Bucket", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.WellAndBucket.rawValue, Venue.AddressKey : Address.WellAndBucket.rawValue, Venue.OpeningTimesKey : OpeningTimes.WellAndBucket.rawValue, Venue.EmailKey : Email.WellAndBucket.rawValue, Venue.PhoneKey : Telephone.WellAndBucket.rawValue],
            [Venue.NameKey : "Shoreditch Grind", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Coffee", Venue.DescritptionKey : Description.ShoreditchGrind.rawValue, Venue.AddressKey : Address.ShoreditchGrind.rawValue, Venue.OpeningTimesKey : OpeningTimes.ShoreditchGrind.rawValue, Venue.EmailKey : Email.ShoreditchGrind.rawValue, Venue.PhoneKey : Telephone.ShoreditchGrind.rawValue],
            [Venue.NameKey : "Goodhood", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Shopping", Venue.DescritptionKey : Description.Goodhood.rawValue, Venue.AddressKey : Address.Goodhood.rawValue, Venue.OpeningTimesKey : OpeningTimes.Goodhood.rawValue, Venue.EmailKey : Email.Goodhood.rawValue, Venue.PhoneKey : Telephone.Goodhood.rawValue],
            [Venue.NameKey : "Brick Lane Market", Venue.AreaKey : Area.Shoreditch.rawValue, Venue.CategoryKey : "Markets", Venue.DescritptionKey : Description.BricklaneMarket.rawValue, Venue.AddressKey : Address.BricklaneMarket.rawValue, Venue.OpeningTimesKey : OpeningTimes.BricklaneMarket.rawValue, Venue.EmailKey : Email.BricklaneMarket.rawValue, Venue.PhoneKey : Telephone.BricklaneMarket.rawValue],
            
            // Bethnal Green
            
            [Venue.NameKey : "The Marksman", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.TheMarksman.rawValue,Venue.AddressKey : Address.TheMarksman.rawValue, Venue.OpeningTimesKey : OpeningTimes.TheMarksman.rawValue, Venue.EmailKey : Email.TheMarksman.rawValue, Venue.PhoneKey : Telephone.TheMarksman.rawValue],
            [Venue.NameKey : "Bistrotheque", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.Bistrotheque.rawValue, Venue.AddressKey : Address.Bistrotheque.rawValue, Venue.OpeningTimesKey : OpeningTimes.Bistrotheque.rawValue, Venue.EmailKey : Email.Bistrotheque.rawValue, Venue.PhoneKey : Telephone.Bistrotheque.rawValue],
            [Venue.NameKey : "Satan’s Whiskers", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.SatansWhiskers.rawValue,Venue.AddressKey : Address.SatansWhiskers.rawValue, Venue.OpeningTimesKey : OpeningTimes.SatansWhiskers.rawValue, Venue.EmailKey : Email.SatansWhiskers.rawValue, Venue.PhoneKey : Telephone.SatansWhiskers.rawValue],
            [Venue.NameKey : "The Royal Oak", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.TheRoyalOak.rawValue,Venue.AddressKey : Address.TheRoyalOak.rawValue, Venue.OpeningTimesKey : OpeningTimes.TheRoyalOak.rawValue, Venue.EmailKey : Email.TheRoyalOak.rawValue, Venue.PhoneKey : Telephone.TheRoyalOak.rawValue],
            [Venue.NameKey : "Conservatory Archives", Venue.AreaKey : Area.BethnalGreen.rawValue, Venue.CategoryKey : "Shopping", Venue.DescritptionKey : Description.ConservatoryArchives.rawValue, Venue.AddressKey : Address.ConservatoryArchives.rawValue, Venue.OpeningTimesKey : OpeningTimes.ConservatoryArchives.rawValue, Venue.EmailKey : Email.ConservatoryArchives.rawValue, Venue.PhoneKey : Telephone.ConservatoryArchives.rawValue],
            
            // London Fields & Hackney Central
            
            [Venue.NameKey : "El Ganso Cafe", Venue.AreaKey : Area.LondonFields.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.ElGansoCafe.rawValue,Venue.AddressKey : Address.ElGansoCafe.rawValue, Venue.OpeningTimesKey : OpeningTimes.ElGansoCafe.rawValue, Venue.EmailKey : Email.ElGansoCafe.rawValue, Venue.PhoneKey : Telephone.ElGansoCafe.rawValue],
            [Venue.NameKey : "NT's", Venue.AreaKey : Area.LondonFields.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.NTs.rawValue, Venue.AddressKey : Address.NTs.rawValue, Venue.OpeningTimesKey : OpeningTimes.NTs.rawValue, Venue.EmailKey : Email.NTs.rawValue, Venue.PhoneKey : Telephone.NTs.rawValue],
            [Venue.NameKey : "Climpson & Sons Cafe", Venue.AreaKey : Area.LondonFields.rawValue, Venue.CategoryKey : "Coffee", Venue.DescritptionKey : Description.ClimpsonAndSons.rawValue, Venue.AddressKey : Address.ClimpsonAndSons.rawValue, Venue.OpeningTimesKey : OpeningTimes.ClimpsonAndSons.rawValue, Venue.EmailKey : Email.ClimpsonAndSons.rawValue, Venue.PhoneKey : Telephone.ClimpsonAndSons.rawValue],
            [Venue.NameKey : "Stranger Than Paradise", Venue.AreaKey : Area.LondonFields.rawValue, Venue.CategoryKey : "Shopping", Venue.DescritptionKey : Description.StrangerThanParadise.rawValue, Venue.AddressKey : Address.StrangerThanParadise.rawValue, Venue.OpeningTimesKey : OpeningTimes.StrangerThanParadise.rawValue, Venue.EmailKey : Email.StrangerThanParadise.rawValue, Venue.PhoneKey : Telephone.StrangerThanParadise.rawValue],
            [Venue.NameKey : "Broadway Market", Venue.AreaKey : Area.LondonFields.rawValue, Venue.CategoryKey : "Markets", Venue.DescritptionKey : Description.BroadwayMarket.rawValue, Venue.AddressKey : Address.BroadwayMarket.rawValue, Venue.OpeningTimesKey : OpeningTimes.BroadwayMarket.rawValue, Venue.EmailKey : Email.BroadwayMarket.rawValue, Venue.PhoneKey : Telephone.BroadwayMarket.rawValue],
            
            // Hackney Wick
            
            [Venue.NameKey : "CRATE Brewery", Venue.AreaKey : Area.HackneyWick.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.CRATEBrewery.rawValue,Venue.AddressKey : Address.CRATEBrewery.rawValue, Venue.OpeningTimesKey : OpeningTimes.CRATEBrewery.rawValue, Venue.EmailKey : Email.CRATEBrewery.rawValue, Venue.PhoneKey : Telephone.CRATEBrewery.rawValue],
            [Venue.NameKey : "Beer Merchants Tap", Venue.AreaKey : Area.HackneyWick.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.BeerMerchantsTap.rawValue, Venue.AddressKey : Address.BeerMerchantsTap.rawValue, Venue.OpeningTimesKey : OpeningTimes.BeerMerchantsTap.rawValue, Venue.EmailKey : Email.BeerMerchantsTap.rawValue, Venue.PhoneKey : Telephone.BeerMerchantsTap.rawValue],
            [Venue.NameKey : "Howling Hops Brewery & Tank Bar", Venue.AreaKey : Area.HackneyWick.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.HowlingHops.rawValue, Venue.AddressKey : Address.HowlingHops.rawValue, Venue.OpeningTimesKey : OpeningTimes.HowlingHops.rawValue, Venue.EmailKey : Email.HowlingHops.rawValue, Venue.PhoneKey : Telephone.HowlingHops.rawValue],
            [Venue.NameKey : "HWK Coffee & Bar", Venue.AreaKey : Area.HackneyWick.rawValue, Venue.CategoryKey : "Coffee", Venue.DescritptionKey : Description.HWK.rawValue,Venue.AddressKey : Address.HWK.rawValue, Venue.OpeningTimesKey : OpeningTimes.HWK.rawValue, Venue.EmailKey : Email.HWK.rawValue, Venue.PhoneKey : Telephone.HWK.rawValue],
            [Venue.NameKey : "Stour Space", Venue.AreaKey : Area.HackneyWick.rawValue, Venue.CategoryKey : "Coffee", Venue.DescritptionKey : Description.StourSpace.rawValue, Venue.AddressKey : Address.StourSpace.rawValue, Venue.OpeningTimesKey : OpeningTimes.StourSpace.rawValue, Venue.EmailKey : Email.StourSpace.rawValue, Venue.PhoneKey : Telephone.StourSpace.rawValue],
            
            // Bow & Mile End
            
            [Venue.NameKey : "Rusty Bike", Venue.AreaKey : Area.Bow.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.RustyBike.rawValue,Venue.AddressKey : Address.RustyBike.rawValue, Venue.OpeningTimesKey : OpeningTimes.RustyBike.rawValue, Venue.EmailKey : Email.RustyBike.rawValue, Venue.PhoneKey : Telephone.RustyBike.rawValue],
            [Venue.NameKey : "Lord Morpeth", Venue.AreaKey : Area.Bow.rawValue, Venue.CategoryKey : "Food", Venue.DescritptionKey : Description.LordMorpeth.rawValue, Venue.AddressKey : Address.LordMorpeth.rawValue, Venue.OpeningTimesKey : OpeningTimes.LordMorpeth.rawValue, Venue.EmailKey : Email.LordMorpeth.rawValue, Venue.PhoneKey : Telephone.LordMorpeth.rawValue],
            [Venue.NameKey : "East London Liquor Company", Venue.AreaKey : Area.Bow.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.EastLondonLiquorCompany.rawValue,Venue.AddressKey : Address.EastLondonLiquorCompany.rawValue, Venue.OpeningTimesKey : OpeningTimes.EastLondonLiquorCompany.rawValue, Venue.EmailKey : Email.EastLondonLiquorCompany.rawValue, Venue.PhoneKey : Telephone.EastLondonLiquorCompany.rawValue],
            [Venue.NameKey : "The Morgan Arms", Venue.AreaKey : Area.Bow.rawValue, Venue.CategoryKey : "Drinks", Venue.DescritptionKey : Description.TheMorganArms.rawValue,Venue.AddressKey : Address.TheMorganArms.rawValue, Venue.OpeningTimesKey : OpeningTimes.TheMorganArms.rawValue, Venue.EmailKey : Email.TheMorganArms.rawValue, Venue.PhoneKey : Telephone.TheMorganArms.rawValue],
            [Venue.NameKey : "Mae + Harvey", Venue.AreaKey : Area.Bow.rawValue, Venue.CategoryKey : "Coffee", Venue.DescritptionKey : Description.MaeAndHarvey.rawValue, Venue.AddressKey : Address.MaeAndHarvey.rawValue, Venue.OpeningTimesKey : OpeningTimes.MaeAndHarvey.rawValue, Venue.EmailKey : Email.MaeAndHarvey.rawValue, Venue.PhoneKey : Telephone.MaeAndHarvey.rawValue],
        ]
    }
    
}



