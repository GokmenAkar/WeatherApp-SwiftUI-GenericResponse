//
//  APIRequest.swift
//  WeatherApp-SwiftUI-GenericResponse
//
//  Created by GÖKMEN AKAR on 15.02.2020.
//  Copyright © 2020 GÖKMEN AKAR. All rights reserved.
//

import Foundation

class APIRequest<T: Codable> {
    var baseURL: String {
        get {
            return "https://api.openweathermap.org/"
        }
    }
    
    var apiPath: String {
        return "data/"
    }
    
    var version: String {
        return "2.5/"
    }
    
    var endPoint: String {
        return  "weather"
    }
    
    var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "appid", value: "e76bfba6749ba60c6af4df60a4dbc1c5")]
    }
    
    var requestType: HTTPMethod {
        return .get
    }
    
    var contentType: String {
        return "application/json"
    }
}
