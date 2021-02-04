//
//  ViewController.swift
//  newsApp
//
//  Created by Martha R on 03/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var articles: [Article] = []
    var service = Service()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
        loadNews()
    }

    // MARK: - Methods
    func loadNews() {
        service.request(router: Router.content) { (result: Result<Content>) in
            switch result {
            case .success(let content):
                self.articles = content.articles
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath) as? NewsTableViewCell else {
                                                        return UITableViewCell()
        }
        
        let new = articles[indexPath.row]
        cell.prepare(news: new)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let new = news[indexPath.row]
//        let showNews = WallpaperViewController(wallpaper: wallpaper)
//        navigationController?.pushViewController(showNews, animated: true)
//
//    }
    
}





