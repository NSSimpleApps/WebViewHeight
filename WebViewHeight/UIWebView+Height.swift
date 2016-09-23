//
//  UIWebView+Height.swift
//  WebViewHeight
//
//  Created by NSSimpleApps on 07.07.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

extension UIWebView {

    func loadFile(from url: URL) throws {
    
        let string = try String(contentsOf: url, encoding: String.Encoding.utf8)
    
        self.loadHTMLString(string, baseURL: url.deletingLastPathComponent())
    }

    var documentHeight: CGFloat {
    
        if let string = self.stringByEvaluatingJavaScript(from: "document.documentElement.offsetHeight"), let height = Float(string) {
        
            return CGFloat(height)
        }
        return 0
    }
}
