//
//  VenuesVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 25/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class VenuesVC: UITableViewController {

    var area: String!
    var category: String!
    var allVenues = Venue.allVenues
    var venuesToDisplay: [Venue] = []
    var chosenVenue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 350
        
        for venue in allVenues! {
            if venue.area == area && venue.category == category {
                venuesToDisplay.append(venue)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venuesToDisplay.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenuesCell", for: indexPath) as! VenuesCell

        cell.customTextLabel.text = venuesToDisplay[indexPath.row].name.uppercased()
        cell.customImageView.image = UIImage(named: venuesToDisplay[indexPath.row].name)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenVenue = venuesToDisplay[indexPath.row]
        performSegue(withIdentifier: "VenueDetails", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenueDetailsVC
        vc.venue = chosenVenue
    }
}
