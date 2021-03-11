//
//  ForecastsListViewModel.swift
//  weatherApp
//
//  Created by Rene Saroza on 3/10/21.
//

import Foundation

struct ForecastsListViewModel {
    var forecasts: Array<ForecastViewModel> = Array()
    let cityName: String
    
    init(city: String) {
        self.cityName = city
        forecasts.append(ForecastViewModel(weatherCondition: "Clear", temperature: "72"))
        forecasts.append(ForecastViewModel(weatherCondition: "Clear", temperature: "72"))
        forecasts.append(ForecastViewModel(weatherCondition: "Clear", temperature: "72"))
        forecasts.append(ForecastViewModel(weatherCondition: "Clear", temperature: "72"))
        forecasts.append(ForecastViewModel(weatherCondition: "Clear", temperature: "72"))
    }
}
