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

 class GarageViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var isPresenting = false
     @Published     var annotations = [
        Garage(name: "London", coordinate: CLLocationCoordinate2D(latitude:36.552696, longitude: 3.108739) ,specialty:"Peinture",address:"blid ouldSelame" ,openingTime: "9:00" ,closingTime: "16:00"),
        Garage(name: "Paris", coordinate: CLLocationCoordinate2D(latitude:36.542696 , longitude:  3.128739), specialty: "scanner"
               ,address:"blid ouldSelame" ,openingTime: "9:00" ,closingTime: "16:00"),
        Garage(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 36.522696, longitude:3.148739), specialty: "électricité automobile" ,address:"blid ouldSelame" ,openingTime: "9:00" ,closingTime: "16:00"),
        Garage(name: "Blida", coordinate: CLLocationCoordinate2D(latitude: 36.422696, longitude:3.148739), specialty: "électricité automobile" ,address:"blid ouldSelame" ,openingTime: "9:00" ,closingTime: "16:00"),
        Garage(name: "Blida", coordinate: CLLocationCoordinate2D(latitude: 36.402696, longitude:3.148739), specialty: "électricité automobile" ,address:"blid ouldSelame" ,openingTime: "9:00" ,closingTime: "16:00"),
        Garage(name: "Blida", coordinate: CLLocationCoordinate2D(latitude: 35.002696, longitude:3.048739), specialty: "électricité automobile" ,address:"blid ouldSelame" ,openingTime: "9:00" ,closingTime: "16:00"),
          
       ]
     @Published  var searchText = ""
     var searchableRecipe: [Garage] {
                 if  searchText.isEmpty{
                     return annotations
                 } else {
                     let lowercasedQuery = searchText.lowercased()
                    
                         return annotations.filter({
                             $0.specialty.lowercased().contains(lowercasedQuery)
                         })
                 }
             }
     @Published   var specialty:Array = ["General mechanic", "électricité automobile","Peinture" ,"scanner","vidange" ,"clim auto" ,"Equilibrage","suspension" ,"Garniture Auto" ,"GPL" ,"vitres auto","CLE  AUTO"]
      var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude:  3.128917), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
    
}
