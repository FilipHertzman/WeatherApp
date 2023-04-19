//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import SwiftUI

struct CurrentWeather: View {
    let weather: WeatherModel
    let weatherViewModel = WeatherViewModel()
    
    @State private var animationOffset: CGFloat = -50

    var body: some View {
        VStack {
            Text(weather.name)
                .font(.system(size: 40))
                .bold()
                .foregroundColor(.black)

            if let iconName = weather.weather.first?.icon {
                let sfSymbol = weatherViewModel.weatherIconSF(symbol: iconName)
                Image(systemName: sfSymbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .offset(x: animationOffset)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            animationOffset = 50
                        }
                    }
                
            }

            Text(weather.weather.first?.description.capitalized ?? "")
                .font(.title)
                .padding(.bottom, 5)
                .foregroundColor(.white)

            HStack {
                Text("\(Int(weather.main.temp.rounded()))°")
                    .font(.system(size: 70))
                    .bold()
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("High: \(Int(weather.main.temp_max.rounded()))°")
                        .bold()
                    Text("Low: \(Int(weather.main.temp_min.rounded()))°")
                }
                .font(.title3)
                .foregroundColor(.white)
            }
            .padding(.bottom, 15)
            HStack {
                VStack {
                    Text("Humidity")
                    Text("\(weather.main.humidity)%")
                        .bold()
                }
                .foregroundColor(.white)
                Spacer()
                VStack {
                    Text("Wind")
                    Text("\(Int(weather.wind.speed.rounded())) m/s")
                        .bold()
                }
                .foregroundColor(.white)
            }
            .padding(.horizontal)
            .font(.title3)
        }
    }
}

// struct CurrentWeather_Previews: PreviewProvider {
//    static var previews: some View {
//
//
//        CurrentWeather()
//            .background(.blue)
//    }
// }
