//
//  MapViewModel.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import Foundation
import MapKit

// MapViewModel is responsible for managing and updating the user's location on a map.
class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Represents the region displayed on the map, initialized with a default location (latitude and longitude)
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.3293, longitude: 18.0686), latitudinalMeters: 500, longitudinalMeters: 500)
    
    // Location manager to handle user's location
    private let locationManager = CLLocationManager()
    
    // Initializes the MapViewModel
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }

    // Location manager delegate function, triggered when user's location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        DispatchQueue.main.async {
            guard let location = locations.last else {
                print("ERROR: No location found")
                return
            }
            // Update the region displayed on the map with the user's current location
            self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            print("DEBUG S MAPVIEWMODEL: \(self.region)")
            self.locationManager.stopUpdatingLocation()
        }
    }
}
