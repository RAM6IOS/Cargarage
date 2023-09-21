//
//  Settings.swift
//  Cargarage
//
//  Created by MACBOOK PRO on 20/9/2023.
//

import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) var dismiss

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
