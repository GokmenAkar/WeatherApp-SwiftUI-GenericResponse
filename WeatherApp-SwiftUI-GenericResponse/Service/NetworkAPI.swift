//
//  NetworkAPI.swift
//  WeatherApp-SwiftUI-GenericResponse
//
//  Created by GÖKMEN AKAR on 15.02.2020.
//  Copyright © 2020 GÖKMEN AKAR. All rights reserved.
//

import Foundation

class NetworkAPI {
    
    typealias responseCompletion<T:Codable> = (T?, Error?) -> Void
    
    func sendRequest<T>(apiRequest: APIRequest<T>, completion: @escaping responseCompletion<T>) {
        let urlRequest = setURLRequest(apiRequest: apiRequest)
        URLSession.shared.dataTask(urlRequest: urlRequest) { (result) in
            switch result {
            case .success((_,  let data)):
                self.handleResponse(apiRequest: apiRequest, data: data, completion: completion)
            case .failure( let error):
                completion(nil, error)
            }
        }.resume()
    }
    
    private func setURLRequest<T>(apiRequest: APIRequest<T>) -> URLRequest {
        let completeURL = apiRequest.baseURL +
                          apiRequest.apiPath +
                          apiRequest.version +
                          apiRequest.endPoint
        var urlComponents = URLComponents(string: completeURL)!
        
        urlComponents.queryItems = apiRequest.queryItems
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "get"
        urlRequest.setValue(apiRequest.contentType, forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
    
    private func handleResponse<T:Codable>(apiRequest: APIRequest<T>, data: Data, completion: @escaping (T?, Error?) -> Void) {
        do {
            let apiResponse = try JSONDecoder().decode(T.self, from: data)
            completion(apiResponse, nil)
        } catch {
            completion(nil, error)
        }
    }
}
