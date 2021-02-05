//
//  WebViewController.swift
//  newsApp
//
//  Created by Martha R on 04/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Properties
    var article: Article
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("teste")
    }
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
        
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        guard let articleURL = article.url else { return }
        guard let url = URL(string: articleURL) else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
