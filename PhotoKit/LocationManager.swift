//
//  LocationManager.swift
//  PhotoKit
//
//  Created by Binh Do-Cao on 1/16/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
	@Published var location: CLLocation?
	private let locationManager = CLLocationManager()

	override init() {
		super.init()
		self.locationManager.delegate = self
		self.locationManager.requestWhenInUseAuthorization()
		self.locationManager.startUpdatingLocation()
	}
}

extension LocationManager: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		location = locations.first
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Error: \(error.localizedDescription)")
	}
}
