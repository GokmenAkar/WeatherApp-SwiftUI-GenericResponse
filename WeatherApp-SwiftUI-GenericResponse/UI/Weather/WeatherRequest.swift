//
//  WeatherRequest.swift
//  WeatherApp-SwiftUI-GenericResponse
//
//  Created by GÖKMEN AKAR on 15.02.2020.
//  Copyright © 2020 GÖKMEN AKAR. All rights reserved.
//

import Foundation

class WeatherRequest: APIRequest<WeatherResponse> {
    var city: String = ""
    
    override var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "q", value: city),
                URLQueryItem(name: "appid", value: "e76bfba6749ba60c6af4df60a4dbc1c5")]
    }
}
