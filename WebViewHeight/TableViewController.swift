//
//  TableViewController.swift
//  WebViewHeight
//
//  Created by NSSimpleApps on 07.07.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    fileprivate var webViewHeight: CGFloat = 100
    
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
        
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.webViewHeight))
        webView.delegate = self
        webView.backgroundColor = UIColor.white
        try! webView.loadFile(from: url!)
        
        return webView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.webViewHeight
    }
}

extension TableViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        webView.scrollView.isScrollEnabled = false
        
        self.webViewHeight = webView.documentHeight
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}


