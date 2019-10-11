//
//  AppDelegate.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 24/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var currentVenue: Venue?
    static var viewVenueOnMap = false
    
    let dataController = DataController(modelName: "EastLondonGuide")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        dataController.load()
        FlickrClient.Auth.dataController = dataController
        
        let userDefaultsArray = UserDefaults.standard.object(forKey: "Favourites") as? [String] ?? [String]()
        let venues = Venue.allVenues
        
        for venue in venues! {
            if userDefaultsArray.contains(venue.name) {
                FavouritesModel.favourites.append(venue)
            }
        }
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        saveViewContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        saveViewContext()
    }    
    
    func saveViewContext () {
          try? dataController.viewContext.save()
      }
}

