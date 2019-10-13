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
    var venueCoordinate: CLLocationCoordinate2D!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        areaMenu.layer.cornerRadius = 10
        areaMenu.layer.masksToBounds = true
        
        setSegmentedControlAttributes(control: categorySelector)

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
                    self.allAnnotations.insert(annotation, at: 0)
                }
                
                // Once Geocoding is complete, check if we have arrived from Venue details VC, if so focus map on that venue
                if self.allAnnotations.count == self.venues?.count {
                    if Global.viewVenueOnMap == true {
                        self.zoomToVenue()
                    } else {
                        let eastLondon = CLLocationCoordinate2D(latitude: 51.529330, longitude: -0.055910)
                        self.setMapRegion(to: eastLondon, atZoomLevel: 6000)
                    }
                }
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Global.viewVenueOnMap == true {
            zoomToVenue()
       }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Global.viewVenueOnMap = false
    }

    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenueDetailsVC
        vc.venue = chosenVenue
        vc.venueCoordinate = venueCoordinate
        vc.arrivedFromMapView = true
    }
    
    
    //MARK: - Private Methods
    
    fileprivate func filterMapAnnotations(for category: String) {
        for venue in allAnnotations {
            if venue.subtitle != category {
                mapView.removeAnnotation(venue)
            } else {
                mapView.addAnnotation(venue)
            }
        }
    }
    
    
    fileprivate func zoomToVenue() {
        let venueToZoomTo = Global.currentVenue
        for annotation in self.allAnnotations {
            if annotation.title == venueToZoomTo?.name.uppercased() {
                setMapRegion(to: annotation.coordinate, atZoomLevel: 700)
                mapView.showAnnotations([annotation], animated: true)
                if venueToZoomTo?.category != categorySelector.titleForSegment(at: categorySelector.selectedSegmentIndex) {
                    categorySelector.selectedSegmentIndex = 0
                }
            }
        }
    }
    
    
    fileprivate func setMapRegion(to area: CLLocationCoordinate2D, atZoomLevel: Double) {
        let region = MKCoordinateRegion(center: area, latitudinalMeters: atZoomLevel, longitudinalMeters: atZoomLevel)
        self.mapView.setRegion(region, animated: true)
    }
    
    
    //MARK: - Action Methods
    
    @IBAction func categorySelection(_ sender: Any) {
        
        switch categorySelector.selectedSegmentIndex {
        case 0:
            mapView.addAnnotations(allAnnotations)
        case 1:
            filterMapAnnotations(for: "Food")
        case 2:
            filterMapAnnotations(for: "Drinks")
        case 3:
            filterMapAnnotations(for: "Coffee")
        case 4:
            filterMapAnnotations(for: "Shopping")
        case 5:
            filterMapAnnotations(for: "Markets")
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
        centerPopupConstraint.constant = -1000
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (tapped) in
            let zoomLevel: Double = 2500
            switch sender.tag {
                case 0:
                    let shoreditch = CLLocationCoordinate2D(latitude: 51.5236637, longitude: -0.0729336)
                    self.setMapRegion(to: shoreditch, atZoomLevel: zoomLevel)
        
                case 1:
                    let bethnalGreen = CLLocationCoordinate2D(latitude: 51.529330, longitude: -0.055910)
                    self.setMapRegion(to: bethnalGreen, atZoomLevel: zoomLevel)

                case 2:
                    let londonFields = CLLocationCoordinate2D(latitude: 51.540238, longitude: -0.057775)
                    self.setMapRegion(to: londonFields, atZoomLevel: zoomLevel)

                case 3:
                    let hackneyWick = CLLocationCoordinate2D(latitude: 51.545790, longitude: -0.055420)
                    self.setMapRegion(to: hackneyWick, atZoomLevel: zoomLevel)

                case 4:
                    let bowAndMileEnd = CLLocationCoordinate2D(latitude: 51.527500, longitude: -0.023540)
                    self.setMapRegion(to: bowAndMileEnd, atZoomLevel: zoomLevel)
                    
                default:
                    break
            }
        }
        UIView.animate(withDuration: 0.2) {
            self.backgroundButton.alpha = 0
        }
    }
    
}

//MARK: - MapView Delegate

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
          view.displayPriority = .required
            
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
        venueCoordinate = view.annotation?.coordinate
        
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "VenueDetails3", sender: self)
        }
    }
}
