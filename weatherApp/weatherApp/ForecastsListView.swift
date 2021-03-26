//
//  ForecastListView.swift
//  weatherApp
//
//

import SwiftUI

struct ForecastsListView: View {
    let forecastListViewModel: ForecastsListViewModel

    var body: some View {
        List(forecastListViewModel.forecasts) { forecast in
            NavigationLink(destination: ForecastDetailView(city: forecastListViewModel.cityName,
                                                           forecastDetailViewModel: forecast.forecastDetail)) {
                HStack {
                    ForecastView(viewModel: forecast)
                }
            }
            .navigationBarTitle(Text("Forecasts"), displayMode: .inline)
        }
    }
}

struct ForecastsListView_Previews: PreviewProvider {
    static let forecastsStore: ForecastsDataStore = ForecastsDataStore()
    // TODO: Figure out how to call fetchForecasts from the previews struct
    static var previews: some View {
        Text("Coming soon ...")
    }
}
