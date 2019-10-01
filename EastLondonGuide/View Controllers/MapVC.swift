//
//  MapVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 30/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var categorySelector: UISegmentedControl!
    @IBOutlet var areaButton: UIBarButtonItem!
    @IBOutlet var centerPopupConstraint: NSLayoutConstraint!
    @IBOutlet var areaMenu: UIView!
    @IBOutlet var backgroundButton: UIButton!
    
    let venues = Venue.allVenues
    var allAnnotations: [MKPointAnnotation] = []
    var chosenVenue: Venue!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let eastLondon = CLLocationCoordinate2D(latitude: 51.529330, longitude: -0.055910)
        let region = MKCoordinateRegion(center: eastLondon, latitudinalMeters: 6000, longitudinalMeters: 6000)
        self.mapView.setRegion(region, animated: true)
        
        areaMenu.layer.cornerRadius = 10
        areaMenu.layer.masksToBounds = true
        
        // Set font for segmented selector
        
        let font: [AnyHashable : Any] = [NSAttributedString.Key.font : UIFont(name: "JosefinSans-Light", size: 10) as Any]
        categorySelector.setTitleTextAttributes(font as? [NSAttributedString.Key : Any], for: .normal)
        categorySelector.backgroundColor = .clear

        // Load venue annotations.
        
        for venue in venues! {
            let address = venue.address?.replacingOccurrences(of: "\n", with: "")
            
            CLGeocoder().geocodeAddressString(address ?? "") { (placemarks, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        //TODO: show error alert
                        print("Error Geocoding \(venue.name)")
                    }
                }
                
                if let placemark = placemarks?.first, let location = placemark.location {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location.coordinate
                    annotation.title = venue.name.uppercased()
                    annotation.subtitle = venue.category
                    
                                        
                    self.mapView.addAnnotation(annotation)
                    
//                    if venue.name == "SMOKESTAK" {
//
//                    }
                    
                    self.allAnnotations.insert(annotation, at: 0)
                }
            }
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenueDetailsVC
//        print(chosenVenue.name)
        vc.venue = chosenVenue
    }
    
    @IBAction func categorySelection(_ sender: Any) {
        
        switch categorySelector.selectedSegmentIndex {
        case 0: print("case 0")
            mapView.addAnnotations(allAnnotations)
            
        case 1: print("case 1")
            for venue in allAnnotations {
                if venue.subtitle != "Food" {
                    mapView.removeAnnotation(venue)
                } else {
                    mapView.addAnnotation(venue)
                    }
                }
            
        case 2: print("case 2")
            for venue in allAnnotations {
                 if venue.subtitle != "Drinks" {
                    mapView.removeAnnotation(venue)
                 } else {
                    mapView.addAnnotation(venue)
                    }
                 }
            
        case 3: print("case 3")
            for venue in allAnnotations {
                 if venue.subtitle != "Coffee" {
                    mapView.removeAnnotation(venue)
                 } else {
                    mapView.addAnnotation(venue)
                    }
                 }
        case 4: print("case 4")
            for venue in allAnnotations {
                 if venue.subtitle != "Shopping" {
                    mapView.removeAnnotation(venue)
                 } else {
                    mapView.addAnnotation(venue)
                    }
                 }
        case 5: print("case 5")
            for venue in allAnnotations {
                 if venue.subtitle != "Markets" {
                    mapView.removeAnnotation(venue)
                 } else {
                    mapView.addAnnotation(venue)
                    }
                 }
        default: break
            
        }
        
    }
    
    
    @IBAction func areaButtonTapped(_ sender: Any) {
        centerPopupConstraint.constant = 0
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundButton.alpha = 0.3
        }
    }
    
    
    @IBAction func areaSelected(_ sender: UIButton) {
        centerPopupConstraint.constant = -380
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (tapped) in

            switch sender.tag {
                case 0:
                    let shoreditch = CLLocationCoordinate2D(latitude: 51.5236637, longitude: -0.0729336)
                    self.setMapRegion(shoreditch)
        
                case 1:
                    let bethnalGreen = CLLocationCoordinate2D(latitude: 51.529330, longitude: -0.055910)
                    self.setMapRegion(bethnalGreen)

                case 2:
                    let londonFields = CLLocationCoordinate2D(latitude: 51.540238, longitude: -0.057775)
                    self.setMapRegion(londonFields)

                case 3:
                    let hackneyWick = CLLocationCoordinate2D(latitude: 51.545790, longitude: -0.055420)
                    self.setMapRegion(hackneyWick)

                case 4:
                    let bowAndMileEnd = CLLocationCoordinate2D(latitude: 51.527500, longitude: -0.023540)
                    self.setMapRegion(bowAndMileEnd)
                    
                default:
                    break
            }
        }
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundButton.alpha = 0
        }
    }
    
    fileprivate func setMapRegion(_ area: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: area, latitudinalMeters: 2500, longitudinalMeters: 2500)
        self.mapView.setRegion(region, animated: true)
    }
    
}

//MARK: MapView Delegate

extension MapVC: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
          dequeuedView.annotation = annotation
          view = dequeuedView
        } else {
          view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
          view.canShowCallout = true
          view.calloutOffset = CGPoint(x: -5, y: 5)
          view.rightCalloutAccessoryView = UIButton(type: .infoDark)
        }
        
        return view
    }
    
    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let venueTitle = view.annotation?.title
        if let venues = venues {
            for venue in venues {
                if venueTitle == venue.name.uppercased() {
                    chosenVenue = venue
                }
            }
        }
        
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "VenueDetails3", sender: self)
        }
    }
}
