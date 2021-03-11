//
//  ForecastDetailView.swift
//  weatherApp
//
//  Created by Rene Saroza on 3/10/21.
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

struct ForecastDetailView_Previews: PreviewProvider {
    static let cityName: String = "Miami Beach"
    static var previews: some View {
        ForecastDetailView(city: cityName)
    }
}
