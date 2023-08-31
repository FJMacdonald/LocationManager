//
//  LocationManagerApp.swift
//  LocationManager
//
//  Created by Francesca MACDONALD on 2023-08-31.
//

import SwiftUI

@main
struct LocationManagerApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
