//
//  ForecastViewModel.swift
//  weatherApp
//
//

import Foundation

struct ForecastViewModel: Identifiable {
    let id = UUID()
    let weatherDescription: String
    let temperature: String
    let forecastDetail: ForecastDetailViewModel

    struct ForecastDetailViewModel {
        let temperature: String
        let feelsLikeDescription: String
        let weatherDescription: String
        let weatherDescriptionLong: String
    }
}
