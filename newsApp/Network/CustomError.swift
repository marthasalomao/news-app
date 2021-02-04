//
//  CustomError.swift
//  newsApp
//
//  Created by Martha R on 03/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case api
    case network
    case parse
    case unknown
}
