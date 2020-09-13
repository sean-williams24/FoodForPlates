//
//  ArticleVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 04/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class ArticleVC: UITableViewController {

    // MARK: - Properties

    var articleTypeViewModel: ArticleTypeViewModel!
    var chosenVenue: String!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = articleTypeViewModel.title.uppercased()
        
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "JosefinSans-Light", size: 12)!,
             NSAttributedString.Key.foregroundColor : UIColor.black]
    }

    
    // MARK: - TableView Delegates & data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleTypeViewModel.articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        cell.articleViewModel = articleTypeViewModel.articles[indexPath.row]
        cell.venueInfoButton.tag = indexPath.row
        cell.venueInfoButton.addTarget(self, action: #selector(venueInfoButtonTapped(_:)), for: .touchUpInside)
        
        return cell
    }


    @objc func venueInfoButtonTapped(_ sender: UIButton) {
        let article = articleTypeViewModel.articles[sender.tag]
        chosenVenue = article.venueName
        performSegue(withIdentifier: "VenueDetails1", sender: sender)
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenueDetailsVC
        let allVenuesViewModel = AllVenuesViewModel()
        
        vc.venueViewModel = allVenuesViewModel.filterVenueBy(name: chosenVenue)
    }
}
