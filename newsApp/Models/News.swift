//
//  News.swift
//  newsApp
//
//  Created by Martha R on 03/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

// MARK: - Content
struct Content: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}

