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
    
    @State var presentedSheet: Garage?
    
   // var exmple = City(name: <#String#>, coordinate: <#CLLocationCoordinate2D#>)
    
   // var annotations = [annotations]
   // @Published var source: Array = [Sources]()
    var specialty:Array = ["Peinture" ,"scanner","électricité automobile","General mechanic","vidange" ,"clim auto"]
    
    @State  var searchText = ""
    var searchableRecipe: [Garage] {
                if  searchText.isEmpty{
                    return model.annotations
                } else {
                    let lowercasedQuery = searchText.lowercased()
                   
                        return model.annotations.filter({
                            $0.specialty.lowercased().contains(lowercasedQuery)
                        })
                }
            }
     

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ZStack(alignment: .topLeading){
                    Map(coordinateRegion: $model.region, showsUserLocation: true, userTrackingMode: .constant(.follow) , annotationItems:searchableRecipe){ location in
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
                        VStack {
                            Text(sheet.name)
                            Text(sheet.specialty)
                        }
                        .padding()
                        
                    }
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(specialty, id: \.self) { specialty in
                                Button{
                                    searchText = specialty
                                } label: {
                                    Text(specialty)
                                        .padding(.vertical ,10)
                                        .padding(.horizontal ,20)
                                        
                                        
                                }
                                //.frame(width:70 , height: 40)
                                .cornerRadius(10)
                               
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                            }
                        }
                        .padding(.vertical,70)
                       .padding(.horizontal ,20)
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

