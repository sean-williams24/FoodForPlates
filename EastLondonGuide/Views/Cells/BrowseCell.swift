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
    
    var venueViewModel: VenueViewModel! {
        didSet {
            areaLabel.text = venueViewModel.area
            venueLabel.text = venueViewModel.name.uppercased()
            categoryLabel.text = venueViewModel.category
            customImageView.image = venueViewModel.image
        }
    }
}
