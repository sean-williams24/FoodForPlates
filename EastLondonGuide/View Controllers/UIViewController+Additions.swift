//
//  UIViewController+Additions.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 29/09/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func letterSpacing(label: UILabel, value: Double) {
        let attributedString = NSMutableAttributedString(string: label.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(value), range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
    }
    
    func showErrorAlert(title: String, error: String) {
        let ac = UIAlertController(title: title, message: error, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
    
    func setSegmentedControlAttributes(control: UISegmentedControl) {
        let font: [AnyHashable : Any] = [NSAttributedString.Key.foregroundColor : UIColor.black,
                                         NSAttributedString.Key.font : UIFont(name: "JosefinSans-Light", size: 10) as Any]
        control.setTitleTextAttributes(font as? [NSAttributedString.Key : Any], for: .normal)
    }
    
    //GIt Testing
}
