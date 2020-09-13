//
//  CategoriesVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 25/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class CategoriesVC: UITableViewController {

    // MARK: - Properties

    var categories: [String]!
    var area: String!
    var chosenCategory = ""
    let viewModel = AllVenuesViewModel()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300
        
        categories = viewModel.categoriesForVenuesIn(area: area)

    }

    // MARK: - Table view delegates & data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        cell.category = categories[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCategory = categories[indexPath.row]
        performSegue(withIdentifier: "Venues", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenuesVC
        vc.area = area
        vc.category = chosenCategory
    }
}
