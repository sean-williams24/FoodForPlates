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
    @IBOutlet var centerPopupConstraint: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backgroundButton: UIButton!
    @IBOutlet var categorySelector: UISegmentedControl!
    @IBOutlet var showFavouritesButton: UIBarButtonItem!
    
    let allVenues = Venue.allVenues!
    var filteredVenues = [Venue]()
    var chosenVenue: Venue!
    var filteredByArea = false
    var alreadyFilteredByCategory = false
    var alreadyFilteredVenues = [Venue]()
    
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredVenues = allVenues
        areaMenu.layer.cornerRadius = 10
        areaMenu.layer.masksToBounds = true
        setSegmentedControlAttributes(control: categorySelector)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if FavouritesModel.favourites.count == 0 {
            showFavouritesButton.isEnabled = false
            FavouritesModel.viewingFavourites = false
            filteredVenues = allVenues
            tableView.reloadData()
        }
        
        if FavouritesModel.viewingFavourites == true {
            showFavouritesButton.isEnabled = false
        } else if FavouritesModel.viewingFavourites == false && FavouritesModel.favourites.count > 0 {
            showFavouritesButton.isEnabled = true
        }
        
        if FavouritesModel.favouriteRemoved == true && FavouritesModel.viewingFavourites == true {
            showFavouritesButton.isEnabled = false
            filteredVenues = FavouritesModel.favourites
            animateTableviewReload(tableView: self.tableView, transitionType: .fromBottom)
        } else if FavouritesModel.favouriteRemoved == true && FavouritesModel.viewingFavourites == false {
            filteredVenues = allVenues
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        FavouritesModel.favouriteRemoved = false
    }
    

    // MARK: - Table view data source

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
        let vc = segue.destination as! VenueDetailsVC
        vc.venue = chosenVenue
    }
    
    
    
    // MARK: - Helper Methods
    
    
    fileprivate func filterLocation(for venueArea: String) {
        if !alreadyFilteredByCategory {
            filteredVenues = allVenues.filter() {$0.area == venueArea}
            animateTableviewReload(tableView: self.tableView, transitionType: .fromBottom)
        } else {
            filteredVenues = alreadyFilteredVenues.filter() {$0.area == venueArea}
            filteredByArea = true
            animateTableviewReload(tableView: self.tableView, transitionType: .fromBottom)
        }
    }
    
    
    func filterCategory(for category: String) {
        alreadyFilteredByCategory = true
        filteredVenues = []
        alreadyFilteredVenues = []
        
        for venue in allVenues {
            if venue.category == category {
                filteredVenues.append(venue)
                alreadyFilteredVenues.append(venue)
            }
        }
        animateTableviewReload(tableView: self.tableView, transitionType: .fromBottom)
    }
    
    
    // MARK: - Action Methods
    
    @IBAction func areaButtonTapped(_ sender: Any) {
        centerPopupConstraint.constant = 0
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundButton.alpha = 0.6
        }
    }
    

    @IBAction func areaSelected(_ sender: UIButton) {
        showFavouritesButton.isEnabled = true
        centerPopupConstraint.constant = 1200
        
        UIView.animate(withDuration: 0.4, delay: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }) {  (tapped)  in
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
    
    @IBAction func categorySelection(_ sender: Any) {
        
        switch categorySelector.selectedSegmentIndex {
        case 0:
            filteredVenues = allVenues
            animateTableviewReload(tableView: self.tableView, transitionType: .fromBottom)
        case 1:
            filterCategory(for: "Food")
        case 2:
            filterCategory(for: "Drinks")
        case 3:
            filterCategory(for: "Coffee")
        case 4:
            filterCategory(for: "Shopping")
        case 5:
            filterCategory(for: "Markets")
        default:
            print("No Selection")
        }
    }
    
    
    @IBAction func showFavourites(_ sender: Any) {
        FavouritesModel.viewingFavourites = !FavouritesModel.viewingFavourites
        filteredVenues = FavouritesModel.favourites
        if FavouritesModel.viewingFavourites {
            showFavouritesButton.isEnabled = false
        } else {
            showFavouritesButton.isEnabled = true
        }
        animateTableviewReload(tableView: self.tableView, transitionType: .fromBottom)
    }
    

    @IBAction func resetToAllVenues(_ sender: Any) {
        alreadyFilteredByCategory = false
        filteredByArea = false
        filteredVenues = allVenues
        FavouritesModel.viewingFavourites = false
        if FavouritesModel.favourites.count > 0 {
            showFavouritesButton.isEnabled = true
        }
        animateTableviewReload(tableView: self.tableView, transitionType: .fromBottom)
        categorySelector.selectedSegmentIndex = 0
    }
    
}