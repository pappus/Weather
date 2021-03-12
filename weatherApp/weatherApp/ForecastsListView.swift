//
//  ForecastListView.swift
//  weatherApp
//
//

import SwiftUI

struct ForecastsListView: View {
    let forecastsStore: ForecastsDataStore

    var body: some View {
        List(forecastsStore.weatherForecastsListViewModel.forecasts) { forecast in
            NavigationLink(destination: ForecastDetailView(city: forecastsStore.currentCity)) {
                HStack {
                    ForecastView(viewModel: forecast)
                }
            }
            .navigationBarTitle(Text("Forecasts"), displayMode: .inline)
        }
    }
}
