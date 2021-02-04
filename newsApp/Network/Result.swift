//
//  Result.swift
//  newsApp
//
//  Created by Martha R on 03/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
