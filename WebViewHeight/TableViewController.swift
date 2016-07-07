//
//  TableViewController.swift
//  WebViewHeight
//
//  Created by NSSimpleApps on 07.07.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    private var webViewHeight: CGFloat = 100
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = "Some cell"

        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let URL = NSBundle.mainBundle().URLForResource("doc", withExtension: "html")
        
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.webViewHeight))
        webView.delegate = self
        webView.backgroundColor = UIColor.whiteColor()
        try! webView.loadFileWithURL(URL!)
        
        return webView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.webViewHeight
    }
    
}

extension TableViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        webView.scrollView.scrollEnabled = false
        
        self.webViewHeight = webView.documentHeight
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}


