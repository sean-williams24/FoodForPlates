//
//  InspirationVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 29/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class InspirationVC: UIViewController {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var inspoTableView: UITableView!
    
    let articleImages = ["Roast", "Breakfast", "Brewery", "Pizza"]
    let articles = ["THE BEST \nSUNDAY \nROASTS IN \nEAST LONDON",
                    "OUR \nFAVOURITE \nEAST LONDON \nBREAKFASTS",
                    "EAST LONDON \nBREWERIES \nAND \nTAPROOMS",
                    "BEST PIZZA IN \nEAST LONDON"]
    
    let articleData = Article.allArticles!
    var chosenArticle: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inspoTableView.rowHeight = 300
        letterSpacing(label: titleLabel, value: 13.0)
    

    }
    

    //MARK: - Navigation
     
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vc = segue.destination as! ArticleVC
         vc.article = chosenArticle
     }
    
    // MARK: - Table View Delegates

}

extension InspirationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InspirationCell", for: indexPath) as! InspirationCell
        
        cell.customImageView.image = UIImage(named: articleImages[indexPath.row])
        cell.customTextLabel.text = articles[indexPath.row]
        letterSpacing(label: cell.customTextLabel, value: 8.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenArticle = articleData[indexPath.row]
        performSegue(withIdentifier: "ArticleVC", sender: self)
    }
    
    
 
}
