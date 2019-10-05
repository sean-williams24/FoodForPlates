//
//  ArticleVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 04/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class ArticleVC: UITableViewController {

    var chosenArticleTitle: String!
    var tempArticlesArray = [Article]()
    var chosenVenue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenArticleTitle = chosenArticleTitle.replacingOccurrences(of: "\n", with: "")

        title = chosenArticleTitle.uppercased()
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "JosefinSans-Light", size: 15)!]
        
        if let allArticles = Article.allArticles {
            for article in allArticles {

                if article.title.uppercased() == chosenArticleTitle {
                    tempArticlesArray.append(article)
                }
            }
        }

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArticlesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        let article = tempArticlesArray[indexPath.row]
        
        // Configure the cell...
        cell.articleImageView.image = UIImage(named: article.venue)
        cell.venueNameLabel.text = article.venue.uppercased()
        cell.venueDescriptionLabel.text = article.info
        cell.venueInfoButton.setTitle("\(article.venue.uppercased()) INFO", for: .normal)
        
        cell.venueInfoButton.tag = indexPath.row
        cell.venueInfoButton.addTarget(self, action: #selector(venueInfoButtonTapped(_:)), for: .touchUpInside)
        
        
        return cell
    }


    @objc func venueInfoButtonTapped(_ sender: UIButton) {
        let article = tempArticlesArray[sender.tag]
        chosenVenue = article.venue
        performSegue(withIdentifier: "VenueDetails1", sender: sender)
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VenueDetailsVC
        if let allVenues = Venue.allVenues {
            for venue in allVenues {
                if venue.name.uppercased() == chosenVenue.uppercased() {
                    vc.venue = venue
                }
            }
        }
    }
}
