//
//  Settings.swift
//  Cargarage
//
//  Created by MACBOOK PRO on 20/9/2023.
//

import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) var dismiss
    let constants = Contacting.shared
    @State private var sendEmail = false



    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        about()
                    } label: {
                        HStack {
                            Image(systemName: "book")
                            Text("about")
                        }
                    }
                    HStack {
                                                          Image(systemName: "i.circle")
                                                          Link("Privacy Policy", destination: URL(string: "https://www.notion.so/Finding-Wat-fce51e5ee1494b578454b5c8a2fa5e16")!)
                                                                      .foregroundColor(.black)
                                                              }
                    
                    HStack {
                                                                   Image(systemName: "paperplane.fill")
                                                               Button {
                                                                       sendEmail.toggle()
                                                               } label: {
                                                                   HStack {
                                                                       Text("Contact")
                                                                           .foregroundColor(.black)
                                                                   }
                                                               }
                                                               .sheet(isPresented: $sendEmail) {
                                                                                                                   MailView(content: constants.contentPreText, to: constants.to,subject: constants.subject)
                                                                                                               }
                                                                   }
                }
            }
            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button {
                                        dismiss()
                                    } label: {
                                        HStack {
                                            Image(systemName: "arrow.left")
                                            Text("Back")
                                                
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }
        }
       
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
