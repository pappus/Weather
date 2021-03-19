//
//  OpenWeatherMapDataModel.swift
//  weatherApp
//
//

import Foundation

struct WeatherData: Codable {
    let temp: Double // Temperature
    let feels_like: Double // Feels like Temperature
}

struct WeatherDescription: Codable {
    let main: String // Short Description
    let description: String // Long Description
}

struct CurrentWeather: Codable {
    let cod: Int // Response Code
    let name: String // City Name
    let dt: Double // Time of data forecasted, unix, UTC
    let main: WeatherData // Dictionary with "main" key which provides temperatures info.
    let weather: [WeatherDescription] // Array with "weather" key
}

struct WeatherForecast: Codable {
    let dt: Double // Time of data forecasted, unix, UTC
    let main: WeatherData
    let weather: [WeatherDescription]
}

struct WeatherForecasts: Codable {
    let cod: String
    let city: CityInfo
    let list: [WeatherForecast]
}

struct CityInfo: Codable {
    let name: String
}
