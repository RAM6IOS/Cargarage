//
//  Testexmp.swift
//  Cargarage
//
//  Created by MACBOOK PRO on 18/9/2023.
//

import SwiftUI

struct Testexmp: View {
    @ObservedObject var userLocation = LocationManger()
    @State  var searchText = ""
    
    
    var searchableRecipe: [Garage] {
                if  searchText.isEmpty{
                    return userLocation.annotations
                } else {
                    let lowercasedQuery = searchText.lowercased()
                   
                        return userLocation.annotations.filter({
                            $0.specialty.lowercased().contains(lowercasedQuery)
                        })
                }
            }
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    Button{
                      searchText = "Peinture"
                    } label: {
                        Text("Peinture")
                            .padding(.vertical ,10)
                            .padding(.horizontal ,20)
                    }
                    .cornerRadius(10)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Button{
                        searchText = "scanner"
                    } label: {
                        Text("scanner")
                            .padding(.vertical ,10)
                            .padding(.horizontal ,20)
                    }
                   
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Button{
                        searchText = "électricité automobile"
                    } label: {
                        Text("électricité automobile")
                            .padding(.vertical ,10)
                            .padding(.horizontal ,20)
                    }
                   
                    
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Button{
                        
                    } label: {
                        Text("General mechanic")
                            .padding(.vertical ,10)
                            .padding(.horizontal ,20)
                    }
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                   
                    Button{
                        
                    } label: {
                        Text("vidange")
                            .padding(.vertical ,10)
                            .padding(.horizontal ,20)
                    }
                    
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Button{
                        
                    } label: {
                        Text("clim auto")
                            .padding(.vertical ,10)
                            .padding(.horizontal ,20)
                    }
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.vertical,70)
            .padding(.horizontal ,20)
            ForEach(searchableRecipe ){ slocti in
                VStack {
                    Text(slocti.name)
                    Text(slocti.specialty)
                }
                .padding()
                
            }
        }
    }
}

struct Testexmp_Previews: PreviewProvider {
    static var previews: some View {
        Testexmp()
    }
}
