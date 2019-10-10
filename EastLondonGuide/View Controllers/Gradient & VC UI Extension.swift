//
//  Gradient & VC UI Extension.swift
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
    
    
    
    func loadNavBarGradient() {
//        guard
//            let navigationController = navigationController,
//            let flareGradientImage = CAGradientLayer.primaryGradient(on: navigationController.navigationBar)
//            else {
//                print("Error creating gradient color!")
//                return
//            }
//        navigationController.navigationBar.barTintColor = UIColor(patternImage: flareGradientImage)
    }
    
    func loadTabBarGradient() {
//        guard
//            let tabBarController = tabBarController,
//            let flare = CAGradientLayer.primaryGradient(on: tabBarController.tabBar)
//            else {
//                print("Error creating gradient color!")
//                return
//        }
//        tabBarController.tabBar.barTintColor = UIColor(patternImage: flare)
    }
    

}


extension CAGradientLayer {
    
//    class func primaryGradient(on view: UIView) -> UIImage? {
//        let gradient = CAGradientLayer()
//        let zinc = UIColor(displayP3Red: 0.2, green: 0.2, blue: 0.1, alpha: 0.8)
//        let lightGrey = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 0.8)
//        var bounds = view.bounds
//        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
//        gradient.frame = bounds
//        gradient.colors = [UIColor.lightGray.cgColor, lightGrey.cgColor, UIColor.lightGray.cgColor, UIColor.lightGray.cgColor, zinc.cgColor]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 0)
//        return gradient.createGradientImage(on: view)
//    }
//
//    private func createGradientImage(on view: UIView) -> UIImage? {
//        var gradientImage: UIImage?
//        UIGraphicsBeginImageContext(view.frame.size)
//        if let context = UIGraphicsGetCurrentContext() {
//            render(in: context)
//            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
//        }
//        UIGraphicsEndImageContext()
//        return gradientImage
//    }
}
