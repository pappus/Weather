//
//  ForecastsDataModel.swift
//  weatherApp
//
//

import Foundation

// Data Model
struct WeatherForecastModel: Codable {
    let weatherCondition: String
    let temperature: String
    let feelsLike: String
    let weatherConditionDescription: String
}

// Data Manager
class ForecastsDataStore {
    var weatherForecastsModel: Array<WeatherForecastModel>
    var currentCity: String = ""
    var weatherForecastsListViewModel: ForecastsListViewModel = ForecastsListViewModel(cityName: "",
                                                                                       forecasts: [])

    init() {
        weatherForecastsModel = Array()
    }

    func fetchForecasts(for city: String) {
        self.currentCity = city
        weatherForecastsModel.removeAll()
        weatherForecastsModel.append(WeatherForecastModel(weatherCondition: "Clear",
                                                     temperature: "70",
                                                     feelsLike: "75",
                                                     weatherConditionDescription: "Clear and sunny"))
        weatherForecastsModel.append(WeatherForecastModel(weatherCondition: "Raining",
                                                     temperature: "55",
                                                     feelsLike: "50",
                                                     weatherConditionDescription: "Raining with thunder"))
        weatherForecastsModel.append(WeatherForecastModel(weatherCondition: "Cloudy",
                                                     temperature: "89",
                                                     feelsLike: "91",
                                                     weatherConditionDescription: "Scattered Clouds"))
        
        self.loadWeatherForecastsViewModel(for: city)
    }

    func loadWeatherForecastsViewModel(for city: String) {
        var weatherForecastViewModelList = Array<ForecastViewModel>()
        for forecastData in weatherForecastsModel {
            weatherForecastViewModelList.append(ForecastViewModel(weatherDescription: forecastData.weatherCondition,
                                                                  temperature: forecastData.temperature,
                                                                  forecastDetail: ForecastViewModel.ForecastDetailViewModel(temperature: forecastData.temperature, feelsLikeDescription: forecastData.feelsLike, weatherDescription: forecastData.weatherCondition, weatherDescriptionLong: forecastData.weatherConditionDescription)))
        }
        weatherForecastsListViewModel = ForecastsListViewModel(cityName: city,
                                                               forecasts: weatherForecastViewModelList)
    }
}
