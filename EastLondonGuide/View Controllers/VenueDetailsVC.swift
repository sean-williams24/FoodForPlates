//
//  VenueDetailsVC2.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 26/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class VenueDetailsVC: UIViewController {

    @IBOutlet var venueImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var descriptionHeight: NSLayoutConstraint!
    @IBOutlet var addressTextView: UITextView!
    @IBOutlet var addressHeight: NSLayoutConstraint!
    @IBOutlet var openingTimesTextView: UITextView!
    @IBOutlet var openingTimesHeight: NSLayoutConstraint!
    @IBOutlet var bookTextView: UITextView!
    @IBOutlet var telephoneTextView: UITextView!
    
    var venue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Set UI elements with venue model data.
        venueImageView.image = UIImage(named: venue.name)
        descriptionLabel.text = venue.name.uppercased()
        descriptionTextView.text = venue.description
        addressTextView.text = venue.address?.uppercased()
        openingTimesTextView.text = venue.openingTimes?.uppercased()
        bookTextView.text = venue.book?.uppercased()
        telephoneTextView.text = "TEL: \(venue.phone?.uppercased() ?? "")"
        
        // Set letter spacing
        let attributedString = NSMutableAttributedString(string: descriptionLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(5.0), range: NSRange(location: 0, length: attributedString.length))
        descriptionLabel.attributedText = attributedString
        
 
        
        
        
        
    }
    
    fileprivate func calculateTextViewHeights(textView: UITextView, constraint: NSLayoutConstraint) {
        let size: CGSize = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        let insets: UIEdgeInsets = textView.textContainerInset
        constraint.constant = size.height + insets.top + insets.bottom
    }
    
    override func viewDidLayoutSubviews() {
        calculateTextViewHeights(textView: descriptionTextView, constraint: descriptionHeight)
        calculateTextViewHeights(textView: addressTextView, constraint: addressHeight)
        calculateTextViewHeights(textView: openingTimesTextView, constraint: openingTimesHeight)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
