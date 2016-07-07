# WebViewHeight
Height of UIWebView can be determine by JS.

```objc

extension UIWebView {

    var documentHeight: CGFloat {
    
        if let string = self.stringByEvaluatingJavaScriptFromString("document.documentElement.offsetHeight"), let height = Float(string) {
        
            return CGFloat(height)
        }
        return 0
    }
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

extension TableViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        webView.scrollView.scrollEnabled = false
        
        self.webViewHeight = webView.documentHeight
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
```
