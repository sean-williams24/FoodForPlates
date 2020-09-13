//
//  GuidesVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 24/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class GuidesVC: UITableViewController {

    let venuesViewModel = AllVenuesViewModel()
    var chosenArea = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venuesViewModel.areas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AreaCell", for: indexPath) as! AreaCell
        cell.area = venuesViewModel.areas[indexPath.row]
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenArea = venuesViewModel.areas[indexPath.row]
        performSegue(withIdentifier: "Categories", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CategoriesVC
        vc.area = chosenArea
    }
}



