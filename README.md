# WebViewHeight
Height of UIWebView can be determined by JS.

```objc

extension UIWebView {

    var documentHeight: CGFloat {

    if let string = self.stringByEvaluatingJavaScript(from: "document.documentElement.offsetHeight"), let height = Float(string) {

        return CGFloat(height)
    }
    return 0
    }
}

override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let URL = Bundle.main.url(forResource: "doc", withExtension: "html")

    let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.webViewHeight))
    webView.delegate = self
    webView.backgroundColor = UIColor.white
    try! webView.loadFile(from: url!)

    return webView
}

override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

return self.webViewHeight
}

extension TableViewController: UIWebViewDelegate {

    func webViewDidFinishLoad(_ webView: UIWebView) {

        webView.scrollView.isScrollEnabled = false

        self.webViewHeight = webView.documentHeight

        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}

```
