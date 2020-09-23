//
//  VenueDetailsVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit
import UberRides
import CoreLocation

class VenueDetailsVC: UIViewController, CLLocationManagerDelegate {

    //MARK: - Outlets

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
    
    
    //MARK: - Properties

    var venueViewModel: VenueViewModel!
    var arrivedFromMapView = false
    var venueCoordinate: CLLocationCoordinate2D?
    var userLocation: CLLocation?
    var dropOffLocation = CLLocation()
    var locationManager = CLLocationManager()
    var venueIsFavourite: Bool {
        return FavouritesModel.favourites.contains(venueViewModel)
    }
    
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Global.currentVenue = venueViewModel
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        setupUI()
        setUberDropLocation()
    }
    
    override func viewDidLayoutSubviews() {
        calculateTextViewHeights(textView: descriptionTextView, constraint: descriptionHeight)
        calculateTextViewHeights(textView: addressTextView, constraint: addressHeight)
        calculateTextViewHeights(textView: openingTimesTextView, constraint: openingTimesHeight)
    }
    
    
    //MARK: - Helper Methods
    
    fileprivate func setupUI() {
        if arrivedFromMapView == true {
            mapButton.isEnabled = false
        }
        
        if venueViewModel.menu == nil {
            menuButton.isEnabled = false
            menuButton.tintColor = .white
        }
        
        venueImageView.image = UIImage(named: venueViewModel.name)
        descriptionLabel.text = venueViewModel.name.uppercased()
        descriptionTextView.text = venueViewModel.description
        addressTextView.text = venueViewModel.address?.uppercased()
        openingTimesTextView.text = venueViewModel.openingTimes?.uppercased()
        telephoneTextView.text = "TEL: \(venueViewModel.phone?.uppercased() ?? "")"
        bookTextView.text = venueViewModel.email?.uppercased()
        
        if venueViewModel.email?.count ?? 10 > 22 {
            bookTextView.font = UIFont(name: bookTextView.font!.fontName, size: 14)
        }
        
        letterSpacing(label: descriptionLabel, value: 5.0)
        
        if venueIsFavourite == true {
            favouriteButton.tintColor = .red
        } else {
            favouriteButton.tintColor = .darkGray
        }
    }
    
    fileprivate func setUberDropLocation() {
        let address = venueViewModel.address?.replacingOccurrences(of: "\n", with: "")
        
        if venueCoordinate == nil {
            //If we havent arrived from MapVC, need to obtain coordinate from address

            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address!) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else { return }

                self.dropOffLocation = location
                self.setupUberButton()
            }
        } else {
            if let venueCoordinate = venueCoordinate {
                dropOffLocation = CLLocation(latitude: venueCoordinate.latitude, longitude: venueCoordinate.longitude)
                self.setupUberButton()
            }
        }
    }
    
    fileprivate func setupUberButton() {
        let uberButton = RideRequestButton()
        let builder = RideParametersBuilder()
        
        builder.dropoffLocation = dropOffLocation
        builder.dropoffNickname = venueViewModel.name
        uberButton.rideParameters = builder.build()
        
        uberButton.center = uberView.center
        uberButton.translatesAutoresizingMaskIntoConstraints = false
        uberView.addSubview(uberButton)
        uberButton.centerXAnchor.constraint(equalTo: uberView.centerXAnchor).isActive = true
    }
    
    fileprivate func calculateTextViewHeights(textView: UITextView, constraint: NSLayoutConstraint) {
        let size: CGSize = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        let insets: UIEdgeInsets = textView.textContainerInset
        constraint.constant = size.height + insets.top + insets.bottom
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locationManager.location
    }
    
    
    //MARK: - Action Methods

    @IBAction func viewOnMapTapped(_ sender: Any) {
        Global.viewVenueOnMap = true
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
            FavouritesModel.favourites = FavouritesModel.favourites.filter() {$0 != venueViewModel}
            FavouritesModel.favouriteRemoved = true
            favouriteButton.tintColor = .darkGray
        } else {
            FavouritesModel.favourites.append(venueViewModel)
            favouriteButton.tintColor = .red
        }

        var favourites: [String] = []
        for venue in FavouritesModel.favourites {
            favourites.append(venue.name)
        }

        UserDefaults.standard.set(favourites, forKey: "Favourites")
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
}
