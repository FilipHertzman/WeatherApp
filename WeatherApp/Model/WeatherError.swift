//
//  WeatherError.swift
//  WeatherApp
//
//  Created by Filip Hertzman on 2023-04-19.
//

import Foundation

enum WeatherError: Error, LocalizedError {
    case invalidURL
    case serverError
    case invalidData
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please try again later"
        case .serverError:
            return "There was an error with the server. Please try again later"
        case .invalidData:
            return "The weather data is invalid. Please try again later"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
