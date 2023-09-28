//
//  GarageDetails .swift
//  Cargarage
//
//  Created by MACBOOK PRO on 26/9/2023.
//

import SwiftUI
import CallKit
import CoreLocation
import CoreLocationUI
import MapKit


struct GarageDetails: View {
    let callController = CXCallController()

    var body: some View {
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
                            let handle = CXHandle(type: .generic, value: "+213553058879") // رقم الهاتف الذي تريد الاتصال به
                                       let startCallAction = CXStartCallAction(call: UUID(), handle: handle)
                                       let transaction = CXTransaction(action: startCallAction)
                                       
                                       callController.request(transaction) { error in
                                           if let error = error {
                                               print("Failed to start call: \(error.localizedDescription)")
                                           } else {
                                               print("Call started successfully")
                                           }
                                       }
                            
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
                            openMap(coordinate: CLLocationCoordinate2D(latitude: 36.422696
                                                                                            , longitude: 3.148739))
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
    func openMap(coordinate: CLLocationCoordinate2D) {
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
            mapItem.openInMaps()
        }
}

struct GarageDetails_Previews: PreviewProvider {
    static var previews: some View {
        GarageDetails()
    }
}
