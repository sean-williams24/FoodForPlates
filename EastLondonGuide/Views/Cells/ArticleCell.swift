//
//  ArticleCell.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 05/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit


class ArticleCell: UITableViewCell {
    
    
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var venueNameLabel: UILabel!
    @IBOutlet var venueDescriptionLabel: UILabel!
    @IBOutlet var venueInfoButton: UIButton!
    
    var articleViewModel: ArticleViewModel! {
        didSet {
            articleImageView.image = articleViewModel.image
            venueNameLabel.text = articleViewModel.venueName
            venueDescriptionLabel.text = articleViewModel.venueDescription
            venueInfoButton.setTitle("\(articleViewModel.venueName.uppercased()) INFO", for: .normal)

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        letterSpacing(label: venueNameLabel, value: 5.0)
    }
    
    
    func letterSpacing(label: UILabel, value: Double) {
        let attributedString = NSMutableAttributedString(string: label.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(value), range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
    }
}


