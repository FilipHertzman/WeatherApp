//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some View {
        ZStack {
            VStack {
                CurrentWeather(weather: viewModel.weather)

                ScrollView {
                    MuiltyDayForecast()
                        .padding(.top, 20)

                    MapView()
                } //: SCROLLVIEW
                .shadow(radius: 10)
                .background(.opacity(0.1))
                .cornerRadius(20)
                .ignoresSafeArea()
            } // vSTACK
        } //: ZSTACK
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea())
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
