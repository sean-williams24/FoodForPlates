//
//  FlickrClient + Extensions.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 09/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation

extension FlickrClient {
    
    struct Auth {
//        static let APIKey = "6fc73c69adc5c8d33679b0b1d91fcd55"
        static var flickrPages = 1
        static var flickrPhotos: [FlickrPhoto]!
    }
    
    enum Endpoints {
        static let base = "https://www.flickr.com/services/rest/"
        static let query = "?method=flickr.photos.search"
        static let apiKey = "&api_key=\(Keys.flickrAPIKey)"
        static let location = "&lat=51.529330&lon=-0.055910&radius=20&radius_units=mi"
    }
}
