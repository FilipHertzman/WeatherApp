//
//  MapView.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import SwiftUI
import MapKit

struct MapView: View {
     // MARK: - PROPERTIES
    
    @ObservedObject var viewModel = MapViewModel()
    
     // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $viewModel.region)
            .frame(height: 200)
            .cornerRadius(20)
            .padding()
            .onAppear {
                print("DEBUG MAPVIEW: Region data = \(self.viewModel.region)")
            }
    }
}

 // MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
