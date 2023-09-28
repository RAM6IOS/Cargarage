//
//  Specialtybutton.swift
//  Cargarage
//
//  Created by MACBOOK PRO on 27/9/2023.
//

import SwiftUI

struct Specialtybutton: View {
     @EnvironmentObject  var model :  GarageViewModel
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(model.specialty, id: \.self) { specialty in
                    Button{
                        model.searchText = specialty
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
}

struct Specialtybutton_Previews: PreviewProvider {
    static var previews: some View {
        Specialtybutton()
    }
}
