//
//  VenueViewModel.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 07/06/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import Foundation
import UIKit

public final class VenueViewModel {
    
    // MARK: - Instance Properties
    
    public let name: String
    public let description: String?
    public let address: String?
    public let openingTimes: String?
    public let phone: String?
    public let area: String
    public let category: String
    public let image: UIImage?
    public let menu: String?
    public let email: String?
    
    
    // MARK: - Object Lifecycle
    public init (venue: Venue) {
        self.name = venue.name
        self.description = venue.description ?? ""
        self.address = venue.address ?? ""
        self.openingTimes = venue.openingTimes ?? ""
        self.phone = venue.phone ?? ""
        self.area = venue.area
        self.category = venue.category
        self.image = UIImage(named: venue.name)
        self.menu = venue.menu
        self.email = venue.email
    }

}

public final class AllVenuesViewModel {
    
    // MARK: - Instance Properties
    public var allVenueViewModels: [VenueViewModel]
    
    public init () {
        self.allVenueViewModels = Venue.allVenues.map({VenueViewModel(venue: $0)})
        
    }
    
    public var areas: [String] {
        return Area.allCases.map({$0.rawValue})
    }
    
    func categoriesForVenuesIn(area: String) -> [String] {
        
        let venuesInArea = Venue.allVenues.filter({$0.area == area})
        
        var categories: [String] = []
        
        for venue in venuesInArea {
            if !categories.contains(venue.category) {
                categories.append(venue.category)
            }
        }
        return categories
    }
    
    
    func filterVenueBy(name: String) -> VenueViewModel {
        return allVenueViewModels.first(where: {$0.name.uppercased() == name.uppercased()})!
    }
    
    
    func filterVenuesFor(category: String, area: String) -> [VenueViewModel] {
        let venues = Venue.allVenues.filter({$0.area == area && $0.category == category })
        return venues.map({VenueViewModel(venue: $0)})
    }
}
