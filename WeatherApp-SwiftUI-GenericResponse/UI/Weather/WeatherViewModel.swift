//
//  WeatherViewModel.swift
//  WeatherApp-SwiftUI-GenericResponse
//
//  Created by GÖKMEN AKAR on 15.02.2020.
//  Copyright © 2020 GÖKMEN AKAR. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var weather: Main!
    
    var cityName: String = ""

    var temperature: String {
        if weather != nil {
            if let temp = weather.temp {
                return String(format: "%.0f", temp)
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if weather != nil {
            if let humidity = weather.humidity {
                return String(format: "%.0f", humidity)
            } else {
                return ""
            }
        } else {
            return ""
        }
    }

    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        let weatherRequest = WeatherRequest()
        weatherRequest.city = city
        NetworkAPI().sendRequest(apiRequest: weatherRequest) { (weatherResponse, error) in
            DispatchQueue.main.async {
                self.weather = weatherResponse!.main
            }
        }
    }
}
