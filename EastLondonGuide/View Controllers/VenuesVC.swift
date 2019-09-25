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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venuesToDisplay.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenuesCell", for: indexPath) as! VenuesCell

        // Configure the cell...
        cell.customTextLabel.text = venuesToDisplay[indexPath.row].name
        cell.customImageView.image = UIImage(named: venuesToDisplay[indexPath.row].name)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenVenue = venuesToDisplay[indexPath.row]
        performSegue(withIdentifier: "VenueDetails", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
