//
//  ForecastListView.swift
//  weatherApp
//
//  Created by Rene Saroza on 3/10/21.
//

import SwiftUI

struct ForecastListView: View {
    let viewModel: ForecastsListViewModel

    var body: some View {
        List(viewModel.forecasts) { forecast in
            NavigationLink(destination: ForecastDetailView(city: viewModel.cityName)) {
                HStack {
                    ForecastView(model: forecast)
                }
            }
            .navigationBarTitle(Text("Forecasts"), displayMode: .inline)
        }
    }
}
