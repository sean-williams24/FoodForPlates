//
//  MenuVC.swift
//  EastLondonGuide
//
//  Created by Sean Williams on 07/10/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit
import WebKit

class MenuVC: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    var venue: Venue!
    var popUpWebview: WKWebView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
       
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        

            
        let newBackButton = UIBarButtonItem(title: "<-", style: .plain, target: self, action: #selector(back(sender:)))
        newBackButton.tintColor = .darkGray
        self.navigationItem.leftBarButtonItem = newBackButton;

        if let menuURL = AppDelegate.venueForMap?.menu {
            let url = URL(string: (menuURL))!
            webView.load(URLRequest(url: url))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {        
        if webView.canGoBack {
            navigationController?.navigationBar.isHidden = false
        }
    }
    
    
    @objc func back(sender: UIBarButtonItem) {
        if(webView.canGoBack) {
             webView.goBack()
        } else {
            navigationController!.popViewController(animated:true)
        }
    }
    
       @objc func backPopUp(sender: UIBarButtonItem) {
            if(popUpWebview!.canGoBack) {
                 popUpWebview!.goBack()
            } else {
                popUpWebview?.removeFromSuperview()
                let vc = storyboard?.instantiateViewController(identifier: "MenuVC") as! MenuVC
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }

    // Create pop up webview for new page load in new window
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        print("PopUp view")
        navigationController?.navigationBar.isHidden = false

        popUpWebview = WKWebView(frame: view.bounds, configuration: configuration)
        popUpWebview!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popUpWebview!.navigationDelegate = self
        popUpWebview!.uiDelegate = self
        view.addSubview(popUpWebview!)

        let newBackButton = UIBarButtonItem(title: "<-", style: .plain, target: self, action: #selector(backPopUp(sender:)))
        newBackButton.tintColor = .darkGray
        self.navigationItem.leftBarButtonItem = newBackButton;
        return popUpWebview
    }
    
    

}
