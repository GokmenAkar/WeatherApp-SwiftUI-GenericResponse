//
//  URLSession+Extensions.swift
//  WeatherApp-SwiftUI-GenericResponse
//
//  Created by GÖKMEN AKAR on 15.02.2020.
//  Copyright © 2020 GÖKMEN AKAR. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(urlRequest: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            
            result(.success((response, data)))
        }
    }
}
