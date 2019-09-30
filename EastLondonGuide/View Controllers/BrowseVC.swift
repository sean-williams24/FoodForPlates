//
//  BrowseVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class BrowseVC: UITableViewController {

    
    let allVenues = Venue.allVenues!
    var chosenVenue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allVenues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrowseCell", for: indexPath) as! BrowseCell
        let venue = allVenues[indexPath.row]

        // Configure the cell...
        cell.areaLabel.text = venue.area
        cell.venueLabel.text = venue.name.uppercased()
        cell.categoryLabel.text = venue.category
        cell.customImageView.image = UIImage(named: venue.name)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenVenue = allVenues[indexPath.row]
        performSegue(withIdentifier: "VenueDetails2", sender: self)
    }

   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! VenueDetailsVC
        // Pass the selected object to the new view controller.
        vc.venue = chosenVenue
    }
    

}
