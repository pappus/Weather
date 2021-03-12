//
//  ForecastDetailView.swift
//  weatherApp
//
//

import SwiftUI

struct ForecastDetailView: View {
    let city: String

    var body: some View {
        VStack {
            Text("Forecast details for city [\(city)]")
        }
        .navigationTitle(city)
    }
}

//struct ForecastDetailView_Previews: PreviewProvider {
//    static let cityName: String = "Miami Beach"
//    static let forecastDetailIndex: Int = 10
//    static var previews: some View {
//        ForecastDetailView(city: cityName, forecastDetailIndex: forecastDetailIndex)
//    }
//}
