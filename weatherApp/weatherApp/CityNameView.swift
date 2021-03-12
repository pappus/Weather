//
//  CityNameView.swift
//  weatherApp
//
//

import SwiftUI

struct CityNameView: View {
    @State private var cityName: String = ""
    @State private var isEditing: Bool = false
    @State private var isNavigationLinkActive: Bool = false
    @State private var forecastsListView = (AnyView(EmptyView()))
    
    private var forecastsModel: ForecastsDataStore
    
    init() { forecastsModel = ForecastsDataStore() }

    var body: some View {
        NavigationView {
            VStack {
                TextField("City Name", text: $cityName) { isEditing in self.isEditing = isEditing }
                    onCommit: { print(cityName.paddedStringWithBrackets()) }
                .padding(.top, 10)
                Divider().background(Color.black)
                VStack {
                    Button("Check Forecasts") {
                        self.fetchForecasts(for: cityName)
                    }
                    .frame(width: 300, height: 40, alignment: .center)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                    .foregroundColor(Color.black)
                    NavigationLink(
                        destination: self.forecastsListView,
                        isActive: self.$isNavigationLinkActive,
                        label: { EmptyView() })
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 60)
            .padding(.vertical, 10)
            .navigationBarTitle(Text("City Search"), displayMode: .inline)
        }
    }

    func fetchForecasts(for city: String) {
        print("fetching forecasts for city \(city)")
        forecastsModel.fetchForecasts(for: city)
        self.isNavigationLinkActive = true
        self.forecastsListView = AnyView(ForecastsListView(forecastsStore: self.forecastsModel))
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        CityNameView()
    }
}

extension String {
    func paddedStringWithBrackets() -> String {
        return "[\(self)]"
    }
}
