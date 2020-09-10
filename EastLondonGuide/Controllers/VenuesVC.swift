//
//  VenuesVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 25/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class VenuesVC: UITableViewController {

    // MARK: - Properties

    var area: String!
    var category: String!
    var venues: [Venue] = []
    var chosenVenue: Venue!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 350
        
        venues = Venue.allVenues.filter({$0.area == area && $0.category == category })
    }

    
    // MARK: - TableView delegates & data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenuesCell", for: indexPath) as! VenuesCell

        cell.customTextLabel.text = venues[indexPath.row].name.uppercased()
        cell.customImageView.image = UIImage(named: venues[indexPath.row].name)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenVenue = venues[indexPath.row]
        performSegue(withIdentifier: "VenueDetails", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenueDetailsVC
        vc.venue = chosenVenue
    }
}
