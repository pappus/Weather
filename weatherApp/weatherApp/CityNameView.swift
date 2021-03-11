//
//  CityNameView.swift
//  weatherApp
//
//  Created by Rene Saroza on 3/9/21.
//

import SwiftUI

struct CityNameView: View {
    @State private var cityName: String = ""
    @State private var isEditing: Bool = false
    @State private var isNavigationLinkActive: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                TextField("City Name", text: $cityName) { isEditing in self.isEditing = isEditing
                } onCommit: {
                    print(cityName.paddedStringWithBrackets())
                }
                .padding(.top, 10)
                Divider().background(Color.black)
                VStack {
                    NavigationLink(destination: ForecastListView(viewModel: ForecastsListViewModel(city: cityName))) {
                        HStack {
                            Text("Check Forecast")
                        }
                        .frame(width: 300, height: 40, alignment: .center)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                        .foregroundColor(Color.black)
                    }
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 60)
            .padding(.vertical, 10)
            .navigationBarTitle(Text("City Search"), displayMode: .inline)
        }
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
