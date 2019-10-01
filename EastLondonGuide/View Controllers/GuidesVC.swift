//
//  GuidesVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 24/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class GuidesVC: UITableViewController {

    
    let areaTitles = ["Shoreditch & Hoxton", "Bethnal Green", "London Fields & Hackney Central", "Hackney Wick", "Bow & Mile End"]
    var chosenArea = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areaTitles.count
    }

  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AreaCell", for: indexPath) as! AreaCell

        // Configure the cell...
        
        cell.customTextLabel.text = areaTitles[indexPath.row].uppercased()
        cell.customImageView.image = UIImage(named: areaTitles[indexPath.row])
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! AreaCell
//        chosenArea = cell.customTextLabel.text
        chosenArea = areaTitles[indexPath.row]
        performSegue(withIdentifier: "Categories", sender: self)
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
        let vc = segue.destination as! CategoriesVC
        // Pass the selected object to the new view controller.
        vc.area = chosenArea
    }
    

}



