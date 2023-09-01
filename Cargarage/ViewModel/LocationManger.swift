//
//  LocationManger.swift
//  Cargarage
//
//  Created by MACBOOK PRO on 1/9/2023.
//

import Foundation
import MapKit
import CoreLocation
import CoreLocationUI

final class LocationManger: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var isPresenting = false
    @Published    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude:  3.128917), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
    var locationManger =  CLLocationManager()
    override init() {
        super.init()
        locationManger.delegate = self
    }
    func requesAllowOnceLocationPermission() {
        locationManger.requestLocation()
    }
    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        DispatchQueue.main.async {
        self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
        }
    }
    nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError erroe:Error) {
        print(erroe.localizedDescription)
    }
}
