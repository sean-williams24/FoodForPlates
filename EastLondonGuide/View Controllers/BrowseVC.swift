//
//  BrowseVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class BrowseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var areaMenu: UIView!
    @IBOutlet var backgroundButton: UIButton!
    @IBOutlet var centerPopupConstraint: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    
    
    
    let allVenues = Venue.allVenues!
    var filteredVenues = [Venue]()
    var chosenVenue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredVenues = allVenues
        areaMenu.layer.cornerRadius = 10
        areaMenu.layer.masksToBounds = true

    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredVenues.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrowseCell", for: indexPath) as! BrowseCell
        let venue = filteredVenues[indexPath.row]

        cell.areaLabel.text = venue.area
        cell.venueLabel.text = venue.name.uppercased()
        cell.categoryLabel.text = venue.category
        cell.customImageView.image = UIImage(named: venue.name)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenVenue = filteredVenues[indexPath.row]
        performSegue(withIdentifier: "VenueDetails2", sender: self)
    }

   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! VenueDetailsVC
        vc.venue = chosenVenue
    }
    
    @IBAction func areaButtonTapped(_ sender: Any) {
        centerPopupConstraint.constant = 0
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundButton.alpha = 0.6
        }
    }
    

    fileprivate func animateTableviewReload() {
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.fillMode = CAMediaTimingFillMode.forwards
        transition.duration = 0.9
        transition.subtype = CATransitionSubtype.fromTop
        self.tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
        self.tableView.reloadData()
    }
    
    fileprivate func filterLocation(for venueName: String) {
        self.filteredVenues = []
        for venue in self.allVenues {
            if venue.area == venueName {
                self.filteredVenues.append(venue)
            }
        }
        animateTableviewReload()
    }
    
    
    @IBAction func areaSelected(_ sender: UIButton) {
        centerPopupConstraint.constant = 1200
        
        UIView.animate(withDuration: 0.4, delay: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }) { (tapped) in
            if sender.tag == 0 {
                self.filterLocation(for: Area.Shoreditch.rawValue)
            } else if sender.tag == 1 {
                self.filterLocation(for: Area.BethnalGreen.rawValue)
            } else if sender.tag == 2 {
                self.filterLocation(for: Area.LondonFields.rawValue)
            } else if sender.tag == 3 {
                self.filterLocation(for: Area.HackneyWick.rawValue)
            }  else if sender.tag == 4 {
                self.filterLocation(for: Area.Bow.rawValue)
            }
        }
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundButton.alpha = 0
        }
    }
    
    
    @IBAction func resetToAllVenues(_ sender: Any) {
        filteredVenues = allVenues
        animateTableviewReload()
    }
    

}
