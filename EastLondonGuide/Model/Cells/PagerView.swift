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
    
    var customLabel: UILabel? {
        if let _ = _textLabel {
            return _textLabel
        }
        
        let view = UIView(frame: .zero)
        view.isUserInteractionEnabled = false
        view.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        
        let textLabel = UILabel(frame: .zero)
        textLabel.textColor = .white
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
        self.contentView.addSubview(view)
        view.addSubview(textLabel)
        
        _textLabel = textLabel
        return textLabel
    }
    
    var seansView: UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = .red
        return view
    }
    
    var seansLabel: UILabel {
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 12)
        return textLabel
    }
    
    fileprivate weak var _textLabel: UILabel?
    
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
