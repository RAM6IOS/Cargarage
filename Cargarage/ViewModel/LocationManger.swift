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

 class LocationManger: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var isPresenting = false
     @Published     var annotations = [
        City(name: "London", coordinate: CLLocationCoordinate2D(latitude:36.552696, longitude: 3.108739) ,specialty:"Peinture"),
        City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude:36.542696 , longitude:  3.128739), specialty: "scanner"),
        City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 36.522696, longitude:3.148739), specialty: "électricité automobile"),
          // City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
       ]
      var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude:  3.128917), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
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
