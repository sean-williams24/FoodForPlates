//
//  VenuesCell.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 25/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class VenuesCell: UITableViewCell {

    @IBOutlet var customImageView: UIImageView!
    @IBOutlet var customTextLabel: UILabel!
    
    var venue: VenueViewModel! {
        didSet {
            customTextLabel.text = venue.name.uppercased()
            customImageView.image = UIImage(named: venue.name)
        }
    }

}
