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
    let image: UIImage
    let description: String
    let website: URL
    let instagram: String
    let menu: Menu
    
}

struct Menu {
    let starters: String
    let mains: String
    let desserts: String
}
