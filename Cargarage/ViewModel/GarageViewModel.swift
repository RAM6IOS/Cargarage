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
import Firebase

 class GarageViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
     @Published var garage = [Garage]()
    @Published var isPresenting = false
     
     @Published  var searchText = ""
     
    
     var searchableRecipe: [Garage] {
                 if  searchText.isEmpty{
                     return garage
                 } else {
                     let lowercasedQuery = searchText.lowercased()
                    
                         return garage.filter({
                             $0.name.lowercased().contains(lowercasedQuery)
                         })
                 }
             }
     func fetchDataGarage() {
             Firestore.firestore().collection("garage").addSnapshotListener { (querySnapshot, error) in
                             guard let documents = querySnapshot?.documents else {
                               print("No documents")
                               return
                             }
                             self.garage = documents.compactMap { (queryDocumentSnapshot) -> Garage? in
                                 return try? queryDocumentSnapshot.data(as: Garage.self)
                             }
                         }
         }
     @Published   var specialty:Array = ["General mechanic", "électricité automobile","Peinture" ,"scanner","vidange" ,"clim auto" ,"Equilibrage","suspension" ,"Garniture Auto" ,"GPL" ,"vitres auto","CLE  AUTO"]
      var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude:  3.128917), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
    
}
