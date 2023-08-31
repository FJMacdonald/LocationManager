//
//  ContentView.swift
//  LocationManager
//
//  Created by Francesca MACDONALD on 2023-08-31.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State private var showPlaceLookupSheet = false
    @State var returnedPlace = Place(mapItem: MKMapItem())
    var body: some View {
        VStack (alignment: .leading) {
            
            Text("Locatiion:\n\(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0)")
            Text("\nReturned Place: \nName: \(returnedPlace.name)\nAddress:\(returnedPlace.address)\nCoords: \(returnedPlace.latitude), \(returnedPlace.longitude)")
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button {
                    showPlaceLookupSheet.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                    Text("Lookup Place")
                }
            }
        }
        .fullScreenCover(isPresented: $showPlaceLookupSheet) {
            PlaceLookupView(returnedPlace: $returnedPlace)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(LocationManager())
        }
    }
}
