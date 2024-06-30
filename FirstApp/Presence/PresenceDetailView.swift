//
//  PresenceDetailView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 28/06/24.
//

import SwiftUI

struct PresenceDetailView: View {
    let idPresence: Int
    var body: some View {
        NavigationStack {
            VStack(content: {
                Text("Hello, this is detail view \(idPresence)")
            })
        }
        .navigationTitle("Detail Presensi")
        .navigationBarTitleDisplayMode(.inline)
    }
}
