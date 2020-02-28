//
//  PagerView.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 28/02/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import Foundation
import UIKit
import FSPagerView

class PagerViewCell: FSPagerViewCell {
    
    var customLabel = UILabel()
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
//        customLabel.frame = CGRect(x: 0, y: 0, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
}
