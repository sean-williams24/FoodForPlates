//
//  VenueDetailsVC2.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class VenueDetailsVC: UIViewController {

    @IBOutlet var venueImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var descriptionHeight: NSLayoutConstraint!
    @IBOutlet var addressTextView: UITextView!
    @IBOutlet var addressHeight: NSLayoutConstraint!
    @IBOutlet var openingTimesTextView: UITextView!
    @IBOutlet var openingTimesHeight: NSLayoutConstraint!
    @IBOutlet var bookTextView: UITextView!
    @IBOutlet var telephoneTextView: UITextView!
    @IBOutlet var mapButton: UIBarButtonItem!
    @IBOutlet var favouriteButton: UIBarButtonItem!
    @IBOutlet var menuButton: UIBarButtonItem!
    
    var venue: Venue!
    var arrivedFromMapView = false
    var venueIsFavourite: Bool {
        return FavouritesModel.favourites.contains(venue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.venueForMap = venue
        
        if arrivedFromMapView == true {
            mapButton.isEnabled = false
        }
        

        
        
        // Set UI elements with venue model data.
        venueImageView.image = UIImage(named: venue.name)
        descriptionLabel.text = venue.name.uppercased()
        descriptionTextView.text = venue.description
        addressTextView.text = venue.address?.uppercased()
        openingTimesTextView.text = venue.openingTimes?.uppercased()
        telephoneTextView.text = "TEL: \(venue.phone?.uppercased() ?? "")"
        bookTextView.text = venue.email?.uppercased()
        
        if venue.email?.count ?? 10 > 22 {
            bookTextView.font = UIFont(name: bookTextView.font!.fontName, size: 14)
        }
        
        letterSpacing(label: descriptionLabel, value: 5.0)
        
        if venueIsFavourite == true {
            favouriteButton.tintColor = .red
        } else {
            favouriteButton.tintColor = .darkGray
        }
        
        
    }
    
    fileprivate func calculateTextViewHeights(textView: UITextView, constraint: NSLayoutConstraint) {
        let size: CGSize = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        let insets: UIEdgeInsets = textView.textContainerInset
        constraint.constant = size.height + insets.top + insets.bottom
    }
    
    override func viewDidLayoutSubviews() {
        calculateTextViewHeights(textView: descriptionTextView, constraint: descriptionHeight)
        calculateTextViewHeights(textView: addressTextView, constraint: addressHeight)
        calculateTextViewHeights(textView: openingTimesTextView, constraint: openingTimesHeight)
    }
    
    @IBAction func viewOnMapTapped(_ sender: Any) {
        AppDelegate.viewVenueOnMap = true
        let tabIndex = 3
        let tabBar = self.tabBarController
        // Change the selected tab item to MapVC
        tabBar?.selectedIndex = tabIndex
        
        // Pop to the navigation controller of that index
        let vc = tabBar?.viewControllers?[tabIndex]
        if let navController = vc?.navigationController {
            navController.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        
        // Persist favourites to user defaults using venue name strings
        
        if venueIsFavourite {
            FavouritesModel.favourites = FavouritesModel.favourites.filter() {$0 != venue}
            FavouritesModel.favouriteRemoved = true
            favouriteButton.tintColor = .darkGray
        } else {
            FavouritesModel.favourites.append(venue)
            favouriteButton.tintColor = .red
        }
        
        print("--------------------------------")
        for venue in FavouritesModel.favourites {
            print("Favourites: \(venue.name)")
        }
        print("--------------------------------")

        var array: [String] = []
        for venue in FavouritesModel.favourites {
            array.append(venue.name)
        }

        UserDefaults.standard.set(array, forKey: "Favourites")

        
    }
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        
        //TODO: DOWNLOAD MENU FROM ZOMATO API, PRESENT ON SLIDING MODAL VC AND PERSIST IN CORE DATA

    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    }


}
