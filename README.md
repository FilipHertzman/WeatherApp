# Weather Forecast and Location App

This Weather App provides up-to-date weather information and showcases the current location on a map. By leveraging SwiftUI, Core Location, and the OpenWeatherMap API, this app offers a visually appealing.

![ WeatherApp ](https://images.squarespace-cdn.com/content/v1/62ddae4178abf52ddb78cf19/3cfefbd1-58b5-4ceb-b33e-9d5990f52d89/Group+200.png?format=2500w)

## Key Features

- **User Interface:** The app's clean layout presents current weather information, including temperature, humidity, wind speed, and a brief weather description. The user interface is designed with simplicity in mind, making it easy to navigate and understand.

- **Visual Weather Representation:** The app uses SF Symbols to display weather icons that represent the current weather conditions. 

- **7-Day Weather Forecast:** The app provides a 7-day weather forecast.

- **MapView Integration:** The app integrates a MapView to display the user's current location accurately. Leveraging the Core Location framework and MapKit, the app accurately determines and displays the user's position on the map.

- **Real-Time Weather Data:** The app fetches real-time weather data from the OpenWeatherMap API. By efficiently updating the user interface using SwiftUI and Combine, users can stay informed about the latest weather conditions.

- **Location Updates:** The app implements the CLLocationManagerDelegate to manage location updates. This ensures the app retrieves weather data based on the user's accurate and timely location.

## Getting Started

To run the Weather Forecast and Location App locally, follow these steps:

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on the desired simulator or device.

## Requirements

- Xcode 12 or later
- Swift 5.3 or later
- iOS 14.0 or later

## Configuration

Before running the app, you need to obtain an API key from OpenWeatherMap. Follow these steps:

1. Visit the [OpenWeatherMap API](https://home.openweathermap.org/users/sign_up) website and sign up for an account.
2. Obtain an API key from your account dashboard.
3. Open the `WeatherAPI.swift` file in the project.
4. Replace the placeholder string `YOUR_API_KEY` with your actual OpenWeatherMap API key.

## License

No License.

## Acknowledgements

The Weather Forecast and Location App utilizes the following third-party libraries and APIs:

- OpenWeatherMap API
- SF Symbols
- MapKit
- Core Location

