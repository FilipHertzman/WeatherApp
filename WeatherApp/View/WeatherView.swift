//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import SwiftUI

struct WeatherView: View {
     // MARK: - PROPERTIES
    @StateObject private var viewModel = WeatherViewModel()
    
    @State private var showAlert = false

     // MARK: - BODY
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
        
        .onReceive(viewModel.$error, perform: { error in
            if error != nil {
                showAlert.toggle()
            }
        })
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.error?.localizedDescription ?? ""),
                dismissButton: .default(Text("OK"), action: {
                    showAlert = false
                })
            )
        })
    }
}

 // MARK: - PREVIEW
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
