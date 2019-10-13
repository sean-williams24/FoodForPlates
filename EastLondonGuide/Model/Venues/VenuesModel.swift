//
//  VenuesModel.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 25/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation
import UIKit


struct Venue: Equatable {
    
    // MARK: Properties
    
    let name: String
    let area: String
    let category: String
    let description: String?
    let address: String?
    let openingTimes: String?
    let email: String?
    let phone: String?
    let tags: String?
    let menu: String?
    
    static let NameKey = "NameKey"
    static let AreaKey = "AreaKey"
    static let CategoryKey = "CategoryKey"
    static let DescriptionKey = "DescriptionKey"
    static let AddressKey = "AddressKey"
    static let OpeningTimesKey = "OpeningTimesKey"
    static let EmailKey = "BookKey"
    static let PhoneKey = "PhoneKey"
    static let TagsKey = "TagsKey"
    static let MenuKey = "MenuKey"
    
 
    
    // MARK: Initializer
    
    init(dictionary: [String : String]) {
        self.name = dictionary[Venue.NameKey]!
        self.area = dictionary[Venue.AreaKey]!
        self.category = dictionary[Venue.CategoryKey]!
        self.description = dictionary[Venue.DescriptionKey]
        self.address = dictionary[Venue.AddressKey]
        self.openingTimes = dictionary[Venue.OpeningTimesKey]
        self.email = dictionary[Venue.EmailKey]
        self.phone = dictionary[Venue.PhoneKey]
        self.tags = dictionary[Venue.TagsKey]
        self.menu = dictionary[Venue.MenuKey]
    }
    
}

enum Area: String {
    case Shoreditch = "Shoreditch & Hoxton"
    case BethnalGreen = "Bethnal Green"
    case LondonFields = "London Fields & Hackney Central"
    case HackneyWick = "Hackney Wick"
    case Bow = "Bow & Mile End"
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
            
            [NameKey : "SMOKESTAK", AreaKey : Area.Shoreditch.rawValue, CategoryKey : "Food", DescriptionKey : Description.Smokestak.rawValue, AddressKey : Address.Smokestak.rawValue, OpeningTimesKey : OpeningTimes.Smokestak.rawValue, EmailKey : Email.Smokestak.rawValue, PhoneKey : Telephone.Smokestak.rawValue, MenuKey : Menu.SMOKESTAK.rawValue],
            [NameKey : "Dishoom", AreaKey : Area.Shoreditch.rawValue, CategoryKey : "Food", DescriptionKey : Description.Dishoom.rawValue, AddressKey : Address.Dishoom.rawValue, OpeningTimesKey : OpeningTimes.Dishoom.rawValue, EmailKey : Email.Dishoom.rawValue, PhoneKey : Telephone.Dishoom.rawValue, MenuKey : Menu.Dishoom.rawValue],
            [NameKey : "Well & Bucket", AreaKey : Area.Shoreditch.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.WellAndBucket.rawValue, AddressKey : Address.WellAndBucket.rawValue, OpeningTimesKey : OpeningTimes.WellAndBucket.rawValue, EmailKey : Email.WellAndBucket.rawValue, PhoneKey : Telephone.WellAndBucket.rawValue, MenuKey : Menu.WellAndBucket.rawValue],
            [NameKey : "Shoreditch Grind", AreaKey : Area.Shoreditch.rawValue, CategoryKey : "Coffee", DescriptionKey : Description.ShoreditchGrind.rawValue, AddressKey : Address.ShoreditchGrind.rawValue, OpeningTimesKey : OpeningTimes.ShoreditchGrind.rawValue, EmailKey : Email.ShoreditchGrind.rawValue, PhoneKey : Telephone.ShoreditchGrind.rawValue],
            [NameKey : "Goodhood", AreaKey : Area.Shoreditch.rawValue, CategoryKey : "Shopping", DescriptionKey : Description.Goodhood.rawValue, AddressKey : Address.Goodhood.rawValue, OpeningTimesKey : OpeningTimes.Goodhood.rawValue, PhoneKey : Telephone.Goodhood.rawValue],
            [NameKey : "Brick Lane Market", AreaKey : Area.Shoreditch.rawValue, CategoryKey : "Markets", DescriptionKey : Description.BricklaneMarket.rawValue, AddressKey : Address.BricklaneMarket.rawValue, OpeningTimesKey : OpeningTimes.BricklaneMarket.rawValue, PhoneKey : Telephone.BricklaneMarket.rawValue, Venue.TagsKey : "Vegan, Outdoor Space, Hipster"],
            
            // Bethnal Green
            
            [NameKey : "The Marksman", AreaKey : Area.BethnalGreen.rawValue, CategoryKey : "Food", DescriptionKey : Description.TheMarksman.rawValue,AddressKey : Address.TheMarksman.rawValue, OpeningTimesKey : OpeningTimes.TheMarksman.rawValue, EmailKey : Email.TheMarksman.rawValue, PhoneKey : Telephone.TheMarksman.rawValue, MenuKey : Menu.TheMarksman.rawValue],
            [NameKey : "Bistrotheque", AreaKey : Area.BethnalGreen.rawValue, CategoryKey : "Food", DescriptionKey : Description.Bistrotheque.rawValue, AddressKey : Address.Bistrotheque.rawValue, OpeningTimesKey : OpeningTimes.Bistrotheque.rawValue, EmailKey : Email.Bistrotheque.rawValue, PhoneKey : Telephone.Bistrotheque.rawValue, MenuKey : Menu.Bistrotheque.rawValue],
            [NameKey : "Satan's Whiskers", AreaKey : Area.BethnalGreen.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.SatansWhiskers.rawValue,AddressKey : Address.SatansWhiskers.rawValue, OpeningTimesKey : OpeningTimes.SatansWhiskers.rawValue, PhoneKey : Telephone.SatansWhiskers.rawValue],
            [NameKey : "The Royal Oak", AreaKey : Area.BethnalGreen.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.TheRoyalOak.rawValue,AddressKey : Address.TheRoyalOak.rawValue, OpeningTimesKey : OpeningTimes.TheRoyalOak.rawValue, PhoneKey : Telephone.TheRoyalOak.rawValue, MenuKey : Menu.TheRoyalOak.rawValue],
            [NameKey : "Conservatory Archives", AreaKey : Area.BethnalGreen.rawValue, CategoryKey : "Shopping", DescriptionKey : Description.ConservatoryArchives.rawValue, AddressKey : Address.ConservatoryArchives.rawValue, OpeningTimesKey : OpeningTimes.ConservatoryArchives.rawValue, EmailKey : Email.ConservatoryArchives.rawValue, PhoneKey : Telephone.ConservatoryArchives.rawValue],
            
            // London Fields & Hackney Central
            
            [NameKey : "El Ganso Cafe", AreaKey : Area.LondonFields.rawValue, CategoryKey : "Food", DescriptionKey : Description.ElGansoCafe.rawValue,AddressKey : Address.ElGansoCafe.rawValue, OpeningTimesKey : OpeningTimes.ElGansoCafe.rawValue, PhoneKey : Telephone.ElGansoCafe.rawValue, MenuKey : Menu.ElGansoCafe.rawValue],
            [NameKey : "NT's", AreaKey : Area.LondonFields.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.NTs.rawValue, AddressKey : Address.NTs.rawValue, OpeningTimesKey : OpeningTimes.NTs.rawValue, EmailKey : Email.NTs.rawValue, PhoneKey : Telephone.NTs.rawValue],
            [NameKey : "Climpson & Sons Cafe", AreaKey : Area.LondonFields.rawValue, CategoryKey : "Coffee", DescriptionKey : Description.ClimpsonAndSons.rawValue, AddressKey : Address.ClimpsonAndSons.rawValue, OpeningTimesKey : OpeningTimes.ClimpsonAndSons.rawValue, EmailKey : Email.ClimpsonAndSons.rawValue, PhoneKey : Telephone.ClimpsonAndSons.rawValue],
            [NameKey : "Stranger Than Paradise", AreaKey : Area.LondonFields.rawValue, CategoryKey : "Shopping", DescriptionKey : Description.StrangerThanParadise.rawValue, AddressKey : Address.StrangerThanParadise.rawValue, OpeningTimesKey : OpeningTimes.StrangerThanParadise.rawValue, EmailKey : Email.StrangerThanParadise.rawValue, PhoneKey : Telephone.StrangerThanParadise.rawValue],
            [NameKey : "Broadway Market", AreaKey : Area.LondonFields.rawValue, CategoryKey : "Markets", DescriptionKey : Description.BroadwayMarket.rawValue, AddressKey : Address.BroadwayMarket.rawValue, OpeningTimesKey : OpeningTimes.BroadwayMarket.rawValue, PhoneKey : Telephone.BroadwayMarket.rawValue],
            
            // Hackney Wick
            
            [NameKey : "CRATE Brewery", AreaKey : Area.HackneyWick.rawValue, CategoryKey : "Food", DescriptionKey : Description.CRATEBrewery.rawValue,AddressKey : Address.CRATEBrewery.rawValue, OpeningTimesKey : OpeningTimes.CRATEBrewery.rawValue, EmailKey : Email.CRATEBrewery.rawValue, PhoneKey : Telephone.CRATEBrewery.rawValue, MenuKey : Menu.CRATEBrewery.rawValue],
            [NameKey : "Beer Merchants Tap", AreaKey : Area.HackneyWick.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.BeerMerchantsTap.rawValue, AddressKey : Address.BeerMerchantsTap.rawValue, OpeningTimesKey : OpeningTimes.BeerMerchantsTap.rawValue, EmailKey : Email.BeerMerchantsTap.rawValue, PhoneKey : Telephone.BeerMerchantsTap.rawValue, MenuKey : Menu.BeerMerchantsTap.rawValue],
            [NameKey : "Howling Hops Brewery & Tank Bar", AreaKey : Area.HackneyWick.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.HowlingHops.rawValue, AddressKey : Address.HowlingHops.rawValue, OpeningTimesKey : OpeningTimes.HowlingHops.rawValue, PhoneKey : Telephone.HowlingHops.rawValue],
            [NameKey : "HWK Coffee & Bar", AreaKey : Area.HackneyWick.rawValue, CategoryKey : "Coffee", DescriptionKey : Description.HWK.rawValue,AddressKey : Address.HWK.rawValue, OpeningTimesKey : OpeningTimes.HWK.rawValue, PhoneKey : Telephone.HWK.rawValue],
            [NameKey : "Stour Space", AreaKey : Area.HackneyWick.rawValue, CategoryKey : "Coffee", DescriptionKey : Description.StourSpace.rawValue, AddressKey : Address.StourSpace.rawValue, OpeningTimesKey : OpeningTimes.StourSpace.rawValue, EmailKey : Email.StourSpace.rawValue, PhoneKey : Telephone.StourSpace.rawValue],
            
            // Bow & Mile End
            
            [NameKey : "Rusty Bike", AreaKey : Area.Bow.rawValue, CategoryKey : "Food", DescriptionKey : Description.RustyBike.rawValue,AddressKey : Address.RustyBike.rawValue, OpeningTimesKey : OpeningTimes.RustyBike.rawValue, EmailKey : Email.RustyBike.rawValue, PhoneKey : Telephone.RustyBike.rawValue, MenuKey : Menu.RustyBike.rawValue],
            [NameKey : "Lord Morpeth", AreaKey : Area.Bow.rawValue, CategoryKey : "Food", DescriptionKey : Description.LordMorpeth.rawValue, AddressKey : Address.LordMorpeth.rawValue, OpeningTimesKey : OpeningTimes.LordMorpeth.rawValue, EmailKey : Email.LordMorpeth.rawValue, PhoneKey : Telephone.LordMorpeth.rawValue, MenuKey : Menu.LordMorpeth.rawValue],
            [NameKey : "East London Liquor Company", AreaKey : Area.Bow.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.EastLondonLiquorCompany.rawValue,AddressKey : Address.EastLondonLiquorCompany.rawValue, OpeningTimesKey : OpeningTimes.EastLondonLiquorCompany.rawValue, EmailKey : Email.EastLondonLiquorCompany.rawValue, PhoneKey : Telephone.EastLondonLiquorCompany.rawValue, MenuKey : Menu.EastLondonLiquorCompany.rawValue],
            [NameKey : "The Morgan Arms", AreaKey : Area.Bow.rawValue, CategoryKey : "Drinks", DescriptionKey : Description.TheMorganArms.rawValue,AddressKey : Address.TheMorganArms.rawValue, OpeningTimesKey : OpeningTimes.TheMorganArms.rawValue, EmailKey : Email.TheMorganArms.rawValue, PhoneKey : Telephone.TheMorganArms.rawValue, MenuKey : Menu.TheMorganArms.rawValue],
            [NameKey : "Mae + Harvey", AreaKey : Area.Bow.rawValue, CategoryKey : "Coffee", DescriptionKey : Description.MaeAndHarvey.rawValue, AddressKey : Address.MaeAndHarvey.rawValue, OpeningTimesKey : OpeningTimes.MaeAndHarvey.rawValue, EmailKey : Email.MaeAndHarvey.rawValue],
        ]
    }
    
}



