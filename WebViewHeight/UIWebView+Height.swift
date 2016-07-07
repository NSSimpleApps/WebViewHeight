//
//  UIWebView+Height.swift
//  WebViewHeight
//
//  Created by NSSimpleApps on 07.07.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

extension UIWebView {


    func loadFileWithURL(URL: NSURL) throws {
    
        let string = try String(contentsOfURL: URL, encoding: NSUTF8StringEncoding)
    
        self.loadHTMLString(string, baseURL: URL.URLByDeletingLastPathComponent)
    }

    var documentHeight: CGFloat {
    
        if let string = self.stringByEvaluatingJavaScriptFromString("document.documentElement.offsetHeight"), let height = Float(string) {
        
            return CGFloat(height)
    }
    return 0
    }
}