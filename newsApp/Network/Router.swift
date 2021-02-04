//
//  Router.swift
//  newsApp
//
//  Created by Martha R on 03/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

//https://newsapi.org/v2/top-headlines?country=br&apiKey=95455642e8ad406e851b5263d1343e9d


import Foundation

enum Router {
    case content
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "newsapi.org"
    }
    
    var path: String {
        return "/v2/top-headlines"
    }
    
    var parameters: [URLQueryItem] {
        let country = "br"
        let apiKey = "95455642e8ad406e851b5263d1343e9d"
        
        return [URLQueryItem(name: "country", value: country),
                URLQueryItem(name: "apiKey", value: apiKey)]
    }
    
    
    var method: String {
        return "GET"
    }
}
