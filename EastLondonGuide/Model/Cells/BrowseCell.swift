//
//  BrowseCell.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class BrowseCell: UITableViewCell {

    
    @IBOutlet var customImageView: UIImageView!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var venueLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
