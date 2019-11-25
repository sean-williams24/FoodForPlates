//
//  ArticleType.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 22/11/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//
import Contentful
import Foundation

final class ArticleType: EntryDecodable, FieldKeysQueryable {
    
    static let contentTypeId: String = "articleType"

    var id: String
    var updatedAt: Date?
    var createdAt: Date?
    var localeCode: String?
        
    let title: String?
    
    var image: Asset?
    var articleData: [ContentfulArticle]?
    
    public required init(from decoder: Decoder) throws {
        let sys         = try decoder.sys()

        id              = sys.id
        localeCode      = sys.locale
        updatedAt       = sys.updatedAt
        createdAt       = sys.createdAt

        let fields      = try decoder.contentfulFieldsContainer(keyedBy: ArticleType.FieldKeys.self)
        self.title      = try fields.decodeIfPresent(String.self, forKey: .title)

        
        try fields.resolveLink(forKey: .image, decoder: decoder, callback: { [weak self] image in
            self?.image = image as? Asset
        })
        
        try fields.resolveLink(forKey: .articleData, decoder: decoder, callback: { [weak self] articleData in
            self?.articleData = articleData as? [ContentfulArticle]
        })
    }
    
    enum FieldKeys: String, CodingKey {
        case title
        case image, articleData
    }
}
