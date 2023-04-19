//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-11.
//

import Foundation

// WeatherModel represents the overall weather data for a location
struct WeatherModel: Codable {
    let name: String           // Name of the location
    let main: Main             // Main weather data, including temperature and humidity
    let weather: [Weather]     // Array of weather conditions at the location
    let wind: Wind             // Wind data, including speed
 
}

// Main represents the main weather data for a location
struct Main: Codable {
    let temp: Double           // Current temperature (in degrees Celsius for metric units)
    let temp_min: Double       // Minimum temperature at the location (in degrees Celsius for metric units)
    let temp_max: Double       // Maximum temperature -
    let humidity: Int          // Humidity percentage at the location
}

// Weather represents a weather condition at a location
struct Weather: Codable {
    let main: String           // Short description of the weather condition Rain etc.
    let description: String    // Longer description of the weather condition Light Rain etc
    let icon: String           // Icon code representing the weather condition (used to fetch the appropriate icon)
}

// Wind represents the wind data for a location.
struct Wind: Codable {
    let speed: Double          // Wind speed at the location (in meters/second for metric units)
}
