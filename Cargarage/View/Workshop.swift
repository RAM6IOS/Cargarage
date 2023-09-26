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
                        VStack(spacing: 20){
                            Image("user")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                            HStack{
                                VStack(alignment: .leading){
                                    HStack(spacing: 20){
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 20))
                                        Text("MECA DIAG AUTO")
                                    }
                                    HStack(spacing: 20){
                                        Image("location")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 25, height: 25)
                                        Text("N02 Rue Gallieni Beaufraisier Oued Koriche")
                                    }
                                    HStack(spacing: 20){
                                        Image(systemName: "person.crop.circle.badge.clock")
                                            .font(.system(size: 20))
                                        Text("09:00 - 16:00")
                                    }
                                    HStack{
                                        Button{
                                            
                                        } label: {
                                           
                                                Image(systemName: "phone.fill")
                                                .padding(10)
                                                
                                        
                                        }
                                        .foregroundColor(.white)
                                        .background(.orange)
                                        .cornerRadius(8)
                                        
                                        //.frame(width: 100 ,height:200)
                                        .font(.system(size: 20))
                                        .clipShape(Circle())
                                        //.padding(20)
                                       
                                        Button{
                                            
                                        } label: {
                                            
                                                Image(systemName: "location.fill")
                                                    .font(.system(size: 20))
                                                    .padding(10)
                                                
                                            
                                        }
                                        .foregroundColor(.white)
                                        .background(.orange)
                                        .cornerRadius(8)
                                        
                                        //.frame(width: 100 ,height:200)
                                        .font(.system(size: 20))
                                        .clipShape(Circle())
                                    }
                                    VStack(alignment: .leading ,spacing: 10){
                                        Text("Servies:")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                        ScrollView(.horizontal){
                                            HStack(spacing: 10){
                                                Text("DIAGNOSTIC")
                                                    .padding(.vertical ,10)
                                                    .padding(.horizontal ,20)
                                                    .background(.orange)
                                                    .foregroundColor(.black)
                                                    .cornerRadius(10)
                                                Text("PROGRAMMATION")
                                                    .padding(.vertical ,10)
                                                    .padding(.horizontal ,20)
                                                    .background(.orange)
                                                    .foregroundColor(.black)
                                                    .cornerRadius(10)
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                }
                                Spacer()
                            }
                            
                        }
                        .padding(.top ,20)
                    .padding()
                    Spacer()
                    .presentationDetents([.medium])
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

