//
//  ForecastView.swift
//  weatherApp
//
//

import SwiftUI

struct ForecastView: View {
    let viewModel: ForecastViewModel
    var body: some View {
        HStack {
            Text(viewModel.weatherDescription)
            Spacer()
            Text("Temp: \(viewModel.temperature)")
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
    }
}

//struct ForecastView_Previews: PreviewProvider {
//    static let model: ForecastViewModel = ForecastViewModel(weatherCondition: "Clear", temperature: "72")
//    static var previews: some View {
//        ForecastView(viewModel: model)
//    }
//}
