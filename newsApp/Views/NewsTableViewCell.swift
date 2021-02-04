//
//  NewsTableViewCell.swift
//  newsApp
//
//  Created by Martha R on 03/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

import Kingfisher
import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var ivNews: UIImageView!
    
    // MARK: - Methods
    func prepare(news: Article) {
        lbTitle.text = news.title
        lbDescription.text = news.description
        let url = URL(string: news.urlToImage)
        ivNews.kf.setImage(with: url)
    }
    
}
    
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}

