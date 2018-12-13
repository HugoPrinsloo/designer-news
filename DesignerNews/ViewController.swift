//
//  ViewController.swift
//  DesignerNews
//
//  Created by Hugo Prinsloo on 2018/12/06.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load("https://www.designernews.co")
        webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        shareButton.transform = CGAffineTransform(translationX: 0, y: 30)
        
        UIView.animate(withDuration: 0.8, delay: 3, options: .curveEaseInOut, animations: {
            self.shareButton.alpha = 1
            self.shareButton.transform = .identity
        }, completion: nil)
        
    }
    
    @objc func presentShareSheet() {
        if let url = webView.url {
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    @IBAction func handleTapped(_ sender: Any) {
        presentShareSheet()
    }
}


extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
