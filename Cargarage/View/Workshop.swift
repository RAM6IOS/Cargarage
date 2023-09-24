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
    @State private var isPresented = false

    
   // var exmple = City(name: <#String#>, coordinate: <#CLLocationCoordinate2D#>)
    
   // var annotations = [annotations]
   // @Published var source: Array = [Sources]()
    var specialty:Array = ["General mechanic", "électricité automobile","Peinture" ,"scanner","vidange" ,"clim auto" ,"Equilibrage","suspension" ,"Garniture Auto" ,"GPL" ,"vitres auto","CLE  AUTO"]
    
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
                        .presentationDetents([.height(100)])
                        
                        
                    }
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(specialty, id: \.self) { specialty in
                                Button{
                                    searchText = specialty
                                } label: {
                                    HStack(spacing: 8){
                                        Image(specialty)
                                            .resizable()
                                            
                                            .frame(width: 30 ,height: 30)
                                        Text(specialty)
                                            
                                    }
                                    .foregroundColor(.black)
                                    .font(.body)
                                    .padding(.vertical ,10)
                                    .padding(.horizontal ,20)
                                        
                                        
                                }
                                
                                //.frame(width:70 , height: 40)
                                .cornerRadius(10)
                               
                                .background(.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                            }
                        }
                        .padding(.vertical,70)
                       .padding(.horizontal ,20)
                    }
                    
                    
                }
                VStack(spacing:5) {
                    Button{
                        isPresented.toggle()
                        
                    } label: {
                        Image("settings")
                            .resizable()
                            .scaledToFit()
                            .padding(5)
                            
                        
                            
                    }
                    .background(.orange)
                    .cornerRadius(8)
                    .frame(width: 60 ,height: 60)
                    .clipShape(Circle())
                    .fullScreenCover(isPresented: $isPresented){
                        Settings()
                    }

                    
                   
                    
                    LocationButton(.currentLocation) {
                        userLocation.requesAllowOnceLocationPermission()
                    }
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(8)
                    
                    //.frame(width: 100 ,height:200)
                    .font(.system(size: 30))
                    .clipShape(Circle())
                    .padding(20)
                    
                    .labelStyle(.iconOnly)
                    .symbolVariant(.fill)
                    .tint(.orange)
                }
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

