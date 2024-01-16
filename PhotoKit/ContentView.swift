//
//  ContentView.swift
//  PhotoKit
//
//  Created by Binh Do-Cao on 1/12/24.
//

import SwiftData

import SwiftUI
import CoreLocation
import Solar

struct ContentView: View {
	@StateObject private var locationManager = LocationManager()
	@State private var sunrise: Date?
	@State private var sunset: Date?

	var body: some View {
		VStack {
			if let sunrise = sunrise, let sunset = sunset {
				VStack {
					Text("Sunrise: \(sunrise, formatter: Self.dateFormatter)")
						.padding()
						.background(Color.yellow)
						.cornerRadius(10)

					Text("Sunset: \(sunset, formatter: Self.dateFormatter)")
						.padding()
						.background(Color.orange)
						.cornerRadius(10)
				}
			} else {
				Text("Calculating sunrise and sunset times...")
			}
		}
		.onReceive(locationManager.$location) { location in
			calculateSunTimes(location: location)
		}
	}

	private static let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .none
		formatter.timeStyle = .medium
		return formatter
	}()

	private func calculateSunTimes(location: CLLocation?) {
		guard let location = location else { return }
		let solar = Solar(for: Date(), coordinate: location.coordinate)
		sunrise = solar?.sunrise
		sunset = solar?.sunset
	}
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
