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
        ZStack {
                    Color.primary.edgesIgnoringSafeArea(.all)
                    Button("Dismiss Modal") {
                        dismiss()
                    }
                }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
