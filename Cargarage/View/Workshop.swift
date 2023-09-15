//
//  Workshop.swift
//  Cargarage
//
//  Created by Ramzi Bouchedoub on 9/8/2023.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI



struct Workshop: View {
    @ObservedObject  var model =  LocationManger()
    @ObservedObject var userLocation = UserLocation()
   // @StateObject var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.552916, longitude: 3.128917), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
   // var annotations = [annotations]
   // @Published var source: Array = [Sources]()
    
    
     

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                Map(coordinateRegion: $model.region, showsUserLocation: true, userTrackingMode: .constant(.follow) , annotationItems:model.annotations){ location in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude:location.coordinate.latitude ,longitude:  location.coordinate.longitude)) {
                        Image("car-repair")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 44, height: 44)
                    }
                }
                
                LocationButton(.currentLocation) {
                    userLocation.requesAllowOnceLocationPermission()
                }
                .foregroundColor(.white)
                .cornerRadius(8)
                //.frame(width: 100 ,height:200)
                .font(.system(size: 30))
                .clipShape(Circle())
                .padding(20)
                
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
                .tint(.blue)
                // .padding(.bottom, 70)
                
            }.ignoresSafeArea(.all)
                                       
                       }
                       
                   
                   
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
