//
//  VenueDetailsVC2.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit
import UberRides
import CoreLocation

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
    @IBOutlet var imagesButton: UIBarButtonItem!
    @IBOutlet var uberView: UIView!
    
    var venue: Venue!
    var arrivedFromMapView = false
    var venueCoordinate: CLLocationCoordinate2D?
    var venueIsFavourite: Bool {
        return FavouritesModel.favourites.contains(venue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.currentVenue = venue
 
//        print(venueCoordinate!)

        if arrivedFromMapView == true {
            mapButton.isEnabled = false
        }
        
        if venue.menu == nil {
            menuButton.isEnabled = false
            menuButton.tintColor = .white
        }
        
        // Set UI elements with venue model data.
        venueImageView.image = UIImage(named: venue.name)
        descriptionLabel.text = venue.name.uppercased()
        descriptionTextView.text = venue.description
        addressTextView.text = venue.address?.uppercased()
        openingTimesTextView.text = venue.openingTimes?.uppercased()
        telephoneTextView.text = "TEL: \(venue.phone?.uppercased() ?? "")"
        bookTextView.text = venue.email?.uppercased()
        
        

        setupUberButton()
        
        
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
    
    
    fileprivate func setupUberButton() {
        
        // ride request button
        let uberButton = RideRequestButton()
        var dropOffLocation = CLLocation()
        let address = venue.address?.replacingOccurrences(of: "\n", with: "")

        
        if venueCoordinate == nil {
            
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address!) { (placemarks, error) in
                guard   let placemarks = placemarks,
                        let location = placemarks.first?.location
                    else {
                        print("No location found")
                        return
                }
                dropOffLocation = location
            }
        } else {
            if let venueCoordinate = venueCoordinate {
            dropOffLocation = CLLocation(latitude: venueCoordinate.latitude, longitude: venueCoordinate.longitude)
            }
        }
        
        // set a dropoffLocation
        let builder = RideParametersBuilder()
        builder.dropoffLocation = dropOffLocation
        builder.dropoffAddress = address
        builder.dropoffNickname = venue.name
        uberButton.setContent()
        uberButton.loadRideInformation()
        uberButton.rideParameters = builder.build()
        uberButton.center = uberView.center
        uberView.addSubview(uberButton)
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
    
        let menuVC = self.storyboard?.instantiateViewController(identifier: "MenuVC")
        let navigationController = UINavigationController(rootViewController: menuVC!)
        self.present(navigationController, animated: true, completion: nil)

    }
    
    
    @IBAction func imagesButtonTapped(_ sender: Any) {
        let imagesVC = self.storyboard?.instantiateViewController(identifier: "VenueImages") as! VenueImagesVC
        let navigationController = UINavigationController(rootViewController: imagesVC)
        self.present(navigationController, animated: true, completion: nil)

    }
    

    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let vc = self.storyboard?.instantiateViewController(identifier: "MenuVC") as! MenuVC
//        vc.venue = venue
//        
//        let vc1 = self.storyboard?.instantiateViewController(identifier: "VenueImages") as! VenueImagesVC
//        vc1.venue = venue
//        print("Prep for segue \(venue.name)")
//                
//    }


}
