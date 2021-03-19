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
class ForecastsDataStore: ObservableObject {
    var currentCity: String = ""
    var weatherForecastsListViewModel: ForecastsListViewModel = ForecastsListViewModel(cityName: "",
                                                                                       forecasts: [])
    init() {
    
    }

    func fetchForecasts(for city: String, completion: @escaping (Bool) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()) {
            // Load a list of WeatherForecast data model objects
            let weatherForcasts: WeatherForecasts = self.load("forecastResponseMiamiBeach.json")
            print("finished loading forecasts ... number of forecasts \(weatherForcasts.list.count)")
            self.loadWeatherForecastsViewModel(from: weatherForcasts)
            completion(true)
        }
    }

    func loadWeatherForecastsViewModel(from model: WeatherForecasts) {
        var weatherForecastViewModelList = Array<ForecastViewModel>()
        for forecastData in model.list {
            weatherForecastViewModelList.append(ForecastViewModel(weatherDescription: forecastData.weather.first?.main.description ?? "N/A",
                                                                  temperature: forecastData.main.temp.description,
                                                                  forecastDetail: ForecastViewModel.ForecastDetailViewModel(temperature: forecastData.main.temp.description, feelsLikeDescription: forecastData.main.feels_like.description,
                                                                                                                            weatherDescription: forecastData.weather.first?.main ?? "N/A",
                                                                                                                            weatherDescriptionLong: forecastData.weather.first?.description ?? "N/A")))
            
            self.weatherForecastsListViewModel = ForecastsListViewModel(cityName: model.city.name, forecasts: weatherForecastViewModelList)
        }
    }
    
    private func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
