//
//  Test5Hybrid.swift
//  Hybrid App47 IOS
//
//  Created by Ujwal Manjunath on 1/20/16.
//  Copyright © 2016 BedBathAndBeyond. All rights reserved.
//

import UIKit
import WebKit

class Test5HybridController: UIViewController {
    
    static let id = "Test5HybridController"

    var webView:WKWebView?
    
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
        setupWebView()
    }
    
    private func loadRequest() {
        
        let contentController = WKUserContentController();
        let userScript = WKUserScript(
            source: "webkit.messageHandlers.didGetHTML.postMessage(document.documentElement.outerHTML.toString());",
            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
            forMainFrameOnly: true
        )
        contentController.addUserScript(userScript)
        contentController.addScriptMessageHandler(
            self,
            name: "didGetHTML"
        )
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: view.bounds, configuration: config)
        
        let url = NSURL(string:"https://m.bedbathandbeyond.com/m/loginPage")
        let request = NSURLRequest(URL:url!)
        webView!.loadRequest(request)
        webView!.allowsBackForwardNavigationGestures = true
        webView!.navigationDelegate = self
        
    }
    
    private func setupWebView() {
        
        view.addSubview(webView!)
        self.view.bringSubviewToFront(self.navBar)
        
        webView!.translatesAutoresizingMaskIntoConstraints = false
        let views = ["view": self.view, "webview": webView!]
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[webview]|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: views)
        view.addConstraints(horizontalConstraints)
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[webview]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: views)
        view.addConstraints(verticalConstraints)
        view.layoutIfNeeded()
    }

    @IBAction func didTapOnBackButton(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Test5HybridController: WKNavigationDelegate {
    

}

extension Test5HybridController: WKScriptMessageHandler {
    
    func userContentController(userContentController: WKUserContentController,
        didReceiveScriptMessage message: WKScriptMessage) {
            
            if message.name == "didGetHTML" {
                if let html = message.body as? String {
                    print(html)
                }
            }
    }
}

extension Test5HybridController: WKUIDelegate {
    
}
