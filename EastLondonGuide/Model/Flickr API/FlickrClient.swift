//
//  FlickrClient.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 08/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation
import UIKit

class FlickrClient {
    
    
    class func taskForGettingFlickrImages(url: String, completion: @escaping(FlickrResponse?, Error?) -> Void) {
        
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                debugPrint("Error downloading images from Google: \(error!)")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(FlickrResponse.self, from: data)
                Auth.flickrPages = min(response.photos.pages, 4000/21)
                Auth.flickrPhotos = response.photos.photo
                completion(response, nil)
            } catch {
                completion(nil, error)
                debugPrint("Decoding Error: \(error)")
            }
        }
        task.resume()
    
    }
    
    
    class func getImageForVenue(venueName: String, completion: @escaping (Bool, Error?) -> Void) {
        if Auth.flickrPages == 0 {
            Auth.flickrPages = 1
        }
        let urlString = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(Auth.APIKey)&text=\(venueName)&format=json&nojsoncallback=1&&per_page=12&page=\(Int.random(in: 0..<Auth.flickrPages))"
        
        taskForGettingFlickrImages(url: urlString) { (response, error) in
            if let _ = response {
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
        
    }
}
