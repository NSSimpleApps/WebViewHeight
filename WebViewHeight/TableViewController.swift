//
//  TableViewController.swift
//  WebViewHeight
//
//  Created by NSSimpleApps on 07.07.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit
import WebKit

class TableViewController: UITableViewController {

    fileprivate var uiWebViewHeight: CGFloat = 100
    fileprivate var wkWebViewHeight: CGFloat = 100
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Some cell"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let url = Bundle.main.url(forResource: "doc", withExtension: "html")
        
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.uiWebViewHeight))
        webView.delegate = self
        webView.backgroundColor = UIColor.white
        try! webView.loadFile(from: url!)
        
        return webView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.uiWebViewHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let url = Bundle.main.url(forResource: "doc", withExtension: "html")!
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.wkWebViewHeight))
        try! webView.loadFile(from: url)
        webView.navigationDelegate = self
        
        return webView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return self.wkWebViewHeight
    }
}

extension TableViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        webView.scrollView.isScrollEnabled = false
        
        self.uiWebViewHeight = webView.documentHeight
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}

extension TableViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        webView.scrollView.isScrollEnabled = false
        
        webView.documentHeight { (height) in
            
            self.wkWebViewHeight = height
            
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
}
