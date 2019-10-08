//
//  GoogleImagesResponse.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 08/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation
import UIKit

//struct GOOGLEResponse: Codable {
//    let googleImages: GoogleImageResponse
//}

struct GoogleImageResponse: Codable {
    let imagesResults: [Image]
    let suggestedSearches: [SuggestedSearches]
    
}

struct Image: Codable {
    let position: Int
    let thumbnail: String
    let original: String
    let source: String
    let title: String
    let link: String
}


struct SuggestedSearches: Codable {
    let name, link, chips, thumbnail, serpapiLink: String
}

enum CodingKeys: String, CodingKey {
    case imagesResults = "images_results"
    case serpapiLink = "serpapi_link"
}
