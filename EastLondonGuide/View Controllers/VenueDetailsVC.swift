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
    @IBOutlet var mapButton: UIBarButtonItem!
    @IBOutlet var favouriteButton: UIBarButtonItem!
    @IBOutlet var menuButton: UIBarButtonItem!
    
    var venue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(venue.name)

        // Set UI elements with venue model data.
        venueImageView.image = UIImage(named: venue.name)
        descriptionLabel.text = venue.name.uppercased()
        descriptionTextView.text = venue.description
        addressTextView.text = venue.address?.uppercased()
        openingTimesTextView.text = venue.openingTimes?.uppercased()
        bookTextView.text = venue.book?.uppercased()
        telephoneTextView.text = "TEL: \(venue.phone?.uppercased() ?? "")"
        
        letterSpacing(label: descriptionLabel, value: 5.0)
        
 
        if venue.category == "Shopping" || venue.category == "Markets" {
            bookTextView.text = ""
        }
        
        
        
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
    
    @IBAction func viewOnMapTapped(_ sender: Any) {
        
        //TODO: NAVIGATE TO MAP VIEW AND SHOW THIS VENUE
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        
        //TODO: PERSIST FAVOURITES TO CORE DATA OR USERDEFAULTS?
    }
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        
        //TODO: DOWNLOAD MENU FROM ZOMATO API, PRESENT ON SLIDING MODAL VC AND PERSIST IN CORE DATA

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
