//
//  annotations.swift
//  Cargarage
//
//  Created by MACBOOK PRO on 15/9/2023.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI
import Firebase
import FirebaseFirestoreSwift



struct Garage: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
   var name: String
    var specialty : [String]
   var address : String?
    var phone:String?
   var image:String?
    var openingTime:String?
    var closingTime:String?
    var coordinate: GeoPoint
    
    enum CodingKeys: String, CodingKey {
         case id
         case name
         case specialty
         case address
         case phone
         case openingTime
         case closingTime
         case coordinate
         case image
         
       }

  
}




