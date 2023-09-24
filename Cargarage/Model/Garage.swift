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


struct Garage: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let specialty : String
    let address : String?
   // let image:String?
    let openingTime:String?
    let closingTime:String?
    
  
}




