//
//  ForecastViewModel.swift
//  weatherApp
//
//  Created by Rene Saroza on 3/10/21.
//

import Foundation

struct ForecastViewModel: Identifiable {
    let id = UUID()
    let weatherCondition: String
    let temperature: String
}
