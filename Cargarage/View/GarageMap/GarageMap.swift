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



struct GarageMap: View {
    @StateObject var model = GarageViewModel()
    @StateObject  var userLocation = UserLocation()
    @State var presentedSheet: Garage?
    @State private var isPresented = false
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .topLeading){
                    Map(coordinateRegion: $model.region, showsUserLocation: true, userTrackingMode: .constant(.follow) , annotationItems:model.searchableRecipe){ location in
                        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude:location.coordinate.latitude ,longitude:  location.coordinate.longitude)) {
                            Image("car-repair")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 44, height: 44)
                                .onTapGesture {
                                    presentedSheet = location
                                }
                        }
                    }
                    .sheet(item: $presentedSheet) { sheet in
                        
                    }
                    Specialtybutton()
                }
                ButtonSettings()
            }.ignoresSafeArea(.all)
                       }
         .environmentObject(model)
         .environmentObject(userLocation)
                   }
    }


struct GarageMap_Previews: PreviewProvider {
    static var previews: some View {
        GarageMap()
    }
}

