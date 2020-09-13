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
    let viewModel = AllVenuesViewModel()
    var venues: [VenueViewModel] = []
    var chosenVenue: VenueViewModel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 350
        
        venues = viewModel.filterVenuesFor(category: category, area: area)
    }

    
    // MARK: - TableView delegates & data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenuesCell", for: indexPath) as! VenuesCell
        cell.venue = venues[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenVenue = venues[indexPath.row]
        performSegue(withIdentifier: "VenueDetails", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenueDetailsVC
        vc.venueViewModel = chosenVenue
    }
}
