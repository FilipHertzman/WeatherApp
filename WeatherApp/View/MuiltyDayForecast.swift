//
//  MuiltyDayForecast.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import SwiftUI

struct MuiltyDayForecast: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("5-Day Forecast")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            
            HStack(spacing: 20) {
                ForEach(viewModel.uniqueDays(from: viewModel.forecast.list), id: \.dt) { item in
                    VStack {
                        Text(viewModel.getDayOfWeek(item.date))
                            .font(.title3)
                            .bold()
                            .foregroundColor(.black)
                        if let iconName = item.weather.first?.icon {
                            let sfSymbol = viewModel.weatherIconSF(symbol: iconName)
                            Image(systemName: sfSymbol)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        }
                        Text("\(Int(item.main.temp.rounded()))°")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            
            
        }
        .padding(.horizontal)
        
    }
}
    

struct MuiltyDayForecast_Previews: PreviewProvider {
    static var previews: some View {
        MuiltyDayForecast()
            .background(.blue)
    }
}
