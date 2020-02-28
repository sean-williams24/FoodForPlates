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
    
    
    var venueNameLabel: insetLabel?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let font = UIFont(name: "JosefinSans-Light", size: 16)
        venueNameLabel = insetLabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 37))
        venueNameLabel?.textColor = .white
        venueNameLabel?.font = font
        venueNameLabel?.textAlignment = .left
        venueNameLabel?.lineBreakMode = .byWordWrapping
        venueNameLabel?.numberOfLines = 2
        venueNameLabel?.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        venueNameLabel?.preferredMaxLayoutWidth = self.bounds.width
        imageView?.addSubview(venueNameLabel!)
    }
    
     func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    fileprivate weak var _textLabel: UILabel?
    
//    override open var textLabel: UILabel? {
//        if let _ = _textLabel {
//            return _textLabel
//        }
//        let view = UIView(frame: .zero)
//        view.isUserInteractionEnabled = false
//        view.backgroundColor = UIColor.red.withAlphaComponent(0.6)
//
//        let textLabel = UILabel(frame: .zero)
//        textLabel.textColor = .white
//        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
//        self.contentView.addSubview(view)
//        view.addSubview(textLabel)
//
////        textLabel.addObserver(self, forKeyPath: "font", options: [.old,.new], context: kvoContext)
//
//        _textLabel = textLabel
//        return textLabel
//    }

}


 class insetLabel: UILabel {

    override func draw(_ rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: 10, dy: 2))
    }
}
