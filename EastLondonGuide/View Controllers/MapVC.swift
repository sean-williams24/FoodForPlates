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
    
    let venues = Venue.allVenues
    var filteredVenues: [Venue]!
    var allAnnotations: [MKPointAnnotation] = []
    var chosenVenue: Venue!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    
                    if venue.name == "SMOKESTAK" {
                        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2500, longitudinalMeters: 2500)
                        self.mapView.setRegion(region, animated: true)
                    }
                    
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
        let ac = UIAlertController(title: "", message: "Shoreditch & Hoxton.", preferredStyle: .actionSheet)
        let popover = ac.popoverPresentationController
        popover?.sourceView = view
        popover?.sourceRect = CGRect(x: 32, y: 32, width: 40, height: 40)

        present(ac, animated: true)
        
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
