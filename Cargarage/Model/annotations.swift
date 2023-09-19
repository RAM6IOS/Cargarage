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


struct City: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let specialty : String
    
  
}




