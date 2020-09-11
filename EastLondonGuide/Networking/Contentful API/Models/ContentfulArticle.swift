//
//  ContentfulArticle.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 22/11/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Contentful
import Foundation

final class ContentfulArticle: EntryDecodable, FieldKeysQueryable {
    
    static let contentTypeId: String = "articles"

    var id: String
    var updatedAt: Date?
    var createdAt: Date?
    var localeCode: String?
        
    let title: String?
    let venue: String?
    let info: String?
    
    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()

        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt

        let fields      = try decoder.contentfulFieldsContainer(keyedBy: ContentfulArticle.FieldKeys.self)
        self.title      = try fields.decodeIfPresent(String.self, forKey: .title)
        self.venue      = try fields.decodeIfPresent(String.self, forKey: .venue)
        self.info       = try fields.decodeIfPresent(String.self, forKey: .info)
    }
    
    enum FieldKeys: String, CodingKey {
        case title, venue, info
    }
}


final class Cat: EntryDecodable, FieldKeysQueryable {
    
      static let contentTypeId: String = "cat"

      // FlatResource members.
      let id: String
      let localeCode: String?
      let updatedAt: Date?
      let createdAt: Date?

      let color: String?
      let name: String?
      let lives: Int?
      let likes: [String]?

      // Relationship fields.
      var bestFriend: Cat?
      var image: Asset?

      public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()

        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt

        let fields      = try decoder.contentfulFieldsContainer(keyedBy: Cat.FieldKeys.self)

        self.name       = try fields.decodeIfPresent(String.self, forKey: .name)
        self.color      = try fields.decodeIfPresent(String.self, forKey: .color)
        self.likes      = try fields.decodeIfPresent(Array<String>.self, forKey: .likes)
        self.lives      = try fields.decodeIfPresent(Int.self, forKey: .lives)

        try fields.resolveLink(forKey: .bestFriend, decoder: decoder) { [weak self] linkedCat in
          self?.bestFriend = linkedCat as? Cat
        }
        try fields.resolveLink(forKey: .image, decoder: decoder) { [weak self] image in
          self?.image = image as? Asset
        }
    }

    // If your field names and your properties names differ, you can define the mapping in your `FieldKeys` enum.
    enum FieldKeys: String, CodingKey {
      case bestFriend, image
      case name, color, likes, lives
}

}
