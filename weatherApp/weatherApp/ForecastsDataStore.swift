//
//  ForecastsDataModel.swift
//  weatherApp
//
//

import Foundation

// Data Manager
class ForecastsDataStore: ObservableObject {
    var currentCity: String = ""
    var weatherForecastsListViewModel: ForecastsListViewModel = ForecastsListViewModel(cityName: "",
                                                                                       forecasts: [])
    @Published var weatherForecastsAvailable: Bool = false
    
    init() {
    
    }

    func fetchForecasts(for cityID: String) {
        self.fetchForecastData(with: cityID) { data, result, error in
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(WeatherForecasts.self, from: data)
                    let weatherForecastViewModelList: Array<ForecastViewModel>
                    weatherForecastViewModelList = self.loadWeatherForecastsViewModel(from: model)
                    self.weatherForecastsListViewModel = ForecastsListViewModel(cityName: model.city.name, forecasts: weatherForecastViewModelList)
                    // TODO - Add validation logic to check whether we have forecast data available before setting property
                    DispatchQueue.main.async { self.weatherForecastsAvailable = true }
                } catch {
                    // TODO - Add error handling ...
                    
                }
            }
        }
    }

    private func loadWeatherForecastsViewModel(from model: WeatherForecasts) -> Array<ForecastViewModel> {
        var weatherForecastViewModelList = Array<ForecastViewModel>()
        for forecastData in model.list {
            weatherForecastViewModelList.append(ForecastViewModel(weatherDescription: forecastData.weather.first?.main.description ?? "N/A",
                                                                  temperature: forecastData.main.temp.description,
                                                                  forecastDetail: ForecastViewModel.ForecastDetailViewModel(temperature: forecastData.main.temp.description, feelsLikeDescription: forecastData.main.feels_like.description,
                                                                                                                            weatherDescription: forecastData.weather.first?.main ?? "N/A",
                                                                                                                            weatherDescriptionLong: forecastData.weather.first?.description ?? "N/A")))
            
        }
        return weatherForecastViewModelList
    }
    
    private func fetchForecastData(with cityID: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let urlPath = "https://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&units=metric&appid=c076b836542bcdc87aba03ac1ef8334e"
        
        guard let url = URL(string: urlPath) else { completion(nil, nil, nil); return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            completion (data, response, error)
        }.resume()
    }
}
