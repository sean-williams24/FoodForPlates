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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        inspoTableView.rowHeight = 300
        letterSpacing(label: titleLabel, value: 13.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
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
    
    
    
}
