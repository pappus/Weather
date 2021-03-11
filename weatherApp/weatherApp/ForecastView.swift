//
//  ForecastView.swift
//  weatherApp
//
//  Created by Rene Saroza on 3/10/21.
//

import SwiftUI

struct ForecastView: View {
    let model: ForecastViewModel
    var body: some View {
        HStack {
            Text(model.weatherCondition)
            Spacer()
            Text("Temp: \(model.temperature)")
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static let model: ForecastViewModel = ForecastViewModel(weatherCondition: "Clear", temperature: "72")
    static var previews: some View {
        ForecastView(model: model)
    }
}
