//
//  ContentView.swift
//  WeatherApp-SwiftUI-GenericResponse
//
//  Created by GÖKMEN AKAR on 15.02.2020.
//  Copyright © 2020 GÖKMEN AKAR. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init() {
        self.weatherViewModel = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter Text Name", text: $weatherViewModel.cityName) {
                self.weatherViewModel.search()
            }
            .font(.custom("Arial", size: 32))
            .padding()
            .fixedSize()
            
            Text(self.weatherViewModel.temperature)
                .font(.custom("Arial", size: 24))
                .foregroundColor(Color.white)
                .offset(y: 100)
                .padding()
        }
        .frame(minWidth:  0, maxWidth:  .infinity,
               minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
