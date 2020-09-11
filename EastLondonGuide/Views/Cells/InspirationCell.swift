//
//  InspirationCell.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 30/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class InspirationCell: UITableViewCell {
    
    @IBOutlet var customImageView: UIImageView!
    @IBOutlet var customTextLabel: UILabel!

    var articleTypeViewModel: ArticleTypeViewModel! {
        didSet {
            customTextLabel.text = articleTypeViewModel.title.uppercased()
            
            DispatchQueue.global(qos: .background).async {
                let image = self.articleTypeViewModel.getImage()
                
                DispatchQueue.main.async {
                    self.customImageView.image = image 
                }
            }
        }
    }
    
    
}


