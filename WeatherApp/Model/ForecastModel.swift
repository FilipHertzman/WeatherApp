//
//  ForecastModel.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import Foundation

// ForecastModel represents the weather forecast data for a location.
struct ForecastModel: Codable {
    let list: [ForecastListItem]     // Array of ForecastListItem, each representing a specific time's weather data
}

// ForecastListItem represents the weather data for a specific time in the forecast.
struct ForecastListItem: Codable {
    let dt: Int                      // Timestamp for the specific time of the weather data (in seconds since 1970)
    let main: Main                   // Main weather data, including temperature and humidity
    let weather: [Weather]           // Array of weather conditions at the specific time
    let wind: Wind                   // Wind data, including speed, for the specific time
}

// Extension to add a computed property to ForecastListItem for easier date handling.
extension ForecastListItem {
    // Computed property to convert the timestamp (dt) into a Date object.
    var date: Date {
        return Date(timeIntervalSince1970: TimeInterval(dt))
    }
}
