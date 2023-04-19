//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import Combine
import CoreLocation
import SwiftUI

// WeatherViewModel is responsible for managing and updating the weather and forecast data, as well as the user's location.
class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Current weather data for the user's location
    @Published var weather = WeatherModel(name: "",
                                          main: Main(temp: 0,
                                                     temp_min: 0,
                                                     temp_max: 0, humidity: 0),
                                          weather: [Weather(main: "",
                                                            description: "",
                                                            icon: "")],
                                          wind: Wind(speed: 0))

    // Forecast data for the user's location
    @Published var forecast = ForecastModel(list: [])

    // Location manager to handle user's location
    private let locationManager = CLLocationManager()
    
    // API key for OpenWeatherMap API
    let apiKey = Config.apiKey
    
    // Boolean flag to prevent multiple location updates
    private var hasUpdatedLocation = false

    // Initializes the WeatherViewModel
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // Location manager delegate function, triggered when user's location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        if !hasUpdatedLocation {
            Task {
                await fetchWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                await fetchForecast(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
            
            print("DEBUG S: \(location)")
            hasUpdatedLocation = true
            locationManager.stopUpdatingLocation()
        }
    }

    // Fetches weather data for a given latitude and longitude
    // This API can I use if I want the current weather
    // Fetches weather data for a given latitude and longitude
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(WeatherModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weather = decodedData
            }
        } catch {
            print("Failed to fetch weather data: \(error.localizedDescription)")
        }
    }
  
    // Fetches forecast data for a given latitude and longitude
    func fetchForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async {
        let url = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(ForecastModel.self, from: data)
            
            DispatchQueue.main.async {
                self.forecast = decodedData
            }
        } catch {
            print("Failed to fetch forecast data: \(error.localizedDescription)")
        }
    }
    
    // This function returns the day of the week as a string
        // for the provided date
    func getDayOfWeek(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: date)
    }
    
    // This function returns an array of unique ForecastListItem objects
        // based on the unique days of the week from the provided forecast list
    func uniqueDays(from forecastList: [ForecastListItem]) -> [ForecastListItem] {
        var uniqueDates: Set<String> = []
        var uniqueDays: [ForecastListItem] = []

        for item in forecastList {
            let day = getDayOfWeek(item.date)
            if let existingIndex = uniqueDays.firstIndex(where: { getDayOfWeek($0.date) == day }) {
                if item.main.temp > uniqueDays[existingIndex].main.temp {
                    uniqueDays[existingIndex] = item
                }
            } else {
                uniqueDates.insert(day)
                uniqueDays.append(item)
            }
        }

        return uniqueDays
    }



    // Returns an SF Symbol string based on the weather icon string provided by the API
    func weatherIconSF(symbol: String) -> String {
        switch symbol {
        case "01d", "01n":
            return "sun.max"
        case "02d", "02n":
            return "cloud.sun"
        case "03d", "03n", "04d", "04n":
            return "cloud"
        case "09d", "09n":
            return "cloud.heavyrain"
        case "10d", "10n":
            return "cloud.rain"
        case "11d", "11n":
            return "cloud.bolt"
        case "13d", "13n":
            return "cloud.snow"
        case "50d", "50n":
            return "cloud.fog"
        default:
            return "exclamationmark.triangle"
        }
    }
    
   
}
