//
//  Service.swift
//  newsApp
//
//  Created by Martha R on 03/02/2021.
//  Copyright © 2021 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

class Service {
    func request<T: Codable>(router: Router, completion: @escaping (Result<T>) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters

        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(CustomError.network))
                return
            }
            
            guard response != nil else {
                completion(.failure(CustomError.api))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.unknown))
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            } catch {
                print(url)
                print(data)
                completion(.failure(CustomError.parse))
            }
        }
        
        dataTask.resume()
    }
}

