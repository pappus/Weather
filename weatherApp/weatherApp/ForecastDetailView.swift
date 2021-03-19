//
//  ForecastDetailView.swift
//  weatherApp
//
//

import SwiftUI

struct ForecastDetailView: View {
    let city: String
    let forecastDetailViewModel: ForecastViewModel.ForecastDetailViewModel

    var body: some View {
        VStack (alignment: .center) {
            VStack {
                Text(forecastDetailViewModel.temperature).font(.largeTitle)
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Feels Like: \(forecastDetailViewModel.feelsLikeDescription)")
                Text(forecastDetailViewModel.weatherDescription)
                Text(forecastDetailViewModel.weatherDescriptionLong)
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding(.top, 30)
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
