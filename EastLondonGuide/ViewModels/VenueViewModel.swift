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
    private let venue: Venue
    public let name: String
    public let description: String
    public let address: String
    public let openingTimes: String
    public let phone: String
    public let area: String
    public let category: String
    public let image: UIImage?
    
    
    // MARK: - Object Lifecycle
    public init (venue: Venue) {
        self.venue = venue
        self.name = venue.name
        self.description = venue.description ?? ""
        self.address = venue.address ?? ""
        self.openingTimes = venue.openingTimes ?? ""
        self.phone = venue.phone ?? ""
        self.area = venue.area
        self.category = venue.category
        self.image = UIImage(named: venue.name)
    }
    

}
