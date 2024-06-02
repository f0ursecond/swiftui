//
//  NavigationBar.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 19/05/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            PresenceView()
                .tabItem {
                    Label("Presensi", systemImage: "person.fill.checkmark")
                }
            OperationScheduleView()
                .tabItem {
                    Label("J.Operasi", systemImage: "calendar")
                }
            MedicalServiceView()
                .tabItem {
                    Label("Jasa Medis", systemImage: "cross.case.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }

        }.accentColor(.white)
    }
}
