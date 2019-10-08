//
//  SerpClient.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 08/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation

class SerpClient {
    
    
    class func taskForGettingGoogleImage(url: String, completion: @escaping(GoogleImageResponse?, Error?) -> Void) {
        
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                debugPrint("Error downloading images from Google: \(error!)")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(GoogleImageResponse.self, from: data)
                completion(response, nil)
            } catch {
                completion(nil, error)
                debugPrint("Decoding Error: \(error)")
            }
        }
        task.resume()
    
    }
    
    
    class func getImageForVenue(venueName: String, completion: @escaping (Bool, Error?) -> Void) {
        
        let urlString = "https://serpapi.com/search?q=\(venueName)&google_domain=google.co.uk&tbm=isch&num=9"
        
        taskForGettingGoogleImage(url: urlString) { (response, error) in
            if let _ = response {
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
        
    }
}
