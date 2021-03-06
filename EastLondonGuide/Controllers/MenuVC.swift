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
    
    //MARK: - Outlets

    @IBOutlet var webView: WKWebView!
    @IBOutlet var progressView: UIProgressView!
    
    
    //MARK: - Properties

    var popUpWebview: WKWebView?
    
    
    //MARK: - Lifecycle Methods

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
        self.navigationItem.leftBarButtonItem = newBackButton

        if let menuURL = Global.currentVenue?.menu {
            let url = URL(string: (menuURL))!
            webView.load(URLRequest(url: url))
        }
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    //MARK: - Navigation Delegate Methods
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
 
    //MARK: - Webkit Delegate Methods

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.canGoBack {
            navigationController?.navigationBar.isHidden = false
        }
        
        if progressView.progress == 1.0 {
            progressView.isHidden = true
        } else {
            progressView.isHidden = false
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

    // Create pop up webview for new page load in current window
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        navigationController?.navigationBar.isHidden = false

        popUpWebview = WKWebView(frame: view.bounds, configuration: configuration)
        popUpWebview!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popUpWebview!.navigationDelegate = self
        popUpWebview!.uiDelegate = self
        view.addSubview(popUpWebview!)

        let newBackButton = UIBarButtonItem(title: "<-", style: .plain, target: self, action: #selector(backPopUp(sender:)))
        newBackButton.tintColor = .darkGray
        self.navigationItem.leftBarButtonItem = newBackButton
        return popUpWebview
    }
}
