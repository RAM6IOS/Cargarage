//
//  ButtonSettings .swift
//  Cargarage
//
//  Created by MACBOOK PRO on 27/9/2023.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ButtonSettings: View {
    @State private var isPresented = false
    @EnvironmentObject  var userLocation : UserLocation
    var body: some View {
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
            .font(.system(size: 30))
            .clipShape(Circle())
            .padding(20)
            .labelStyle(.iconOnly)
            .symbolVariant(.fill)
            .tint(.orange)
        }
    }
}

struct ButtonSettings_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSettings()
    }
}
