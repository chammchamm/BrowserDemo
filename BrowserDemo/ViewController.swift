//
//  ViewController.swift
//  BrowserDemo
//
//  Created by Jennifer Lin on 2019/6/22.
//  Copyright © 2019 Jennifer Lin. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        urlTextField.delegate = self
        webView.navigationDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(
            animated)
        
        let urlString:String = "https://www.google.com"
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        urlTextField.text = urlString
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString: String = textField.text!
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func btnForwardClicked(_ sender: UIButton) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        
        urlTextField.text = webView.url?.absoluteString
    }
}

