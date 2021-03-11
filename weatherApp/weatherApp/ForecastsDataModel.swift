//
//  ForecastsDataModel.swift
//  weatherApp
//
//  Created by Rene Saroza on 3/11/21.
//

import Foundation

struct WeatherForecastModel: Codable {
    let weatherCondition: String
    let temperature: String
    let feelsLike: String
    let weatherConditionDescription: String
}

class ForecastsDataModel: ObservableObject {
    var weatherForecasts: Array<WeatherForecastModel>

    init() {
        weatherForecasts = Array()
    }

    func fetchForecasts(for city: String) {
        weatherForecasts.append(WeatherForecastModel(weatherCondition: "Clear",
                                                     temperature: "72",
                                                     feelsLike: "75",
                                                     weatherConditionDescription: "Partly Cloudy"))
        weatherForecasts.append(WeatherForecastModel(weatherCondition: "Clear",
                                                     temperature: "72",
                                                     feelsLike: "75",
                                                     weatherConditionDescription: "Partly Cloudy"))
        weatherForecasts.append(WeatherForecastModel(weatherCondition: "Clear",
                                                     temperature: "72",
                                                     feelsLike: "75",
                                                     weatherConditionDescription: "Partly Cloudy"))
        weatherForecasts.append(WeatherForecastModel(weatherCondition: "Clear",
                                                     temperature: "72",
                                                     feelsLike: "75",
                                                     weatherConditionDescription: "Partly Cloudy"))
        weatherForecasts.append(WeatherForecastModel(weatherCondition: "Clear",
                                                     temperature: "72",
                                                     feelsLike: "75",
                                                     weatherConditionDescription: "Partly Cloudy"))

    }
    
    
}

