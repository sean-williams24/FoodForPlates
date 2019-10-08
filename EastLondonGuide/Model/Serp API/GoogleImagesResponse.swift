//
//  GoogleImagesResponse.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 08/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation

struct GoogleImageResponse: Codable{
    let imageResults: Image
}

struct Image: Codable {
    let position: Int
    let thumbnail: String
    let original: String
    let source: String
    let title: String
    let link: String
}


enum CodingKeys: String, CodingKey {
    case imageResults = "image_results"
}
