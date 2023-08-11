//
//  Workshop.swift
//  Cargarage
//
//  Created by Ramzi Bouchedoub on 9/8/2023.
//

import SwiftUI
import MapKit

struct Workshop: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let annotations = [
           City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
           City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
           City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
           City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
       ]

    var body: some View {
        NavigationView {
                       ZStack(alignment: .bottomTrailing) {
                           Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow),  annotationItems: annotations) { location in
                               MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: 51.507222,
                                                                                longitude: -0.1275)) {
                                  
                                       Image("location")
                                           .resizable()
                                           .scaledToFill()
                                           .frame(width: 44, height: 44)
                                   
                               }
                           }
                       }
                       .ignoresSafeArea(.all)
                   }
                   .navigationViewStyle(StackNavigationViewStyle())
                   }
                    
    }


struct Workshop_Previews: PreviewProvider {
    static var previews: some View {
        Workshop()
    }
}

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
