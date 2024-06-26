//
//  NavigationBar.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 19/05/24.
//

import SwiftUI

struct NavigationBar: View {
    @StateObject private var userRepository = UserRepository()
    @StateObject private var authRepository = AuthRepository()
    @StateObject private var medicalServiceRepository = MedicalServiceRepository()

    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                PresenceView()
                    .tabItem {
                        Label("Presensi", systemImage: "person.fill.checkmark")
                    }
                OperationScheduleView().environmentObject(userRepository)
                    .tabItem {
                        Label("J.Operasi", systemImage: "calendar")
                    }
                MedicalServiceView().environmentObject(medicalServiceRepository)
                    .tabItem {
                        Label("Jasa Medis", systemImage: "cross.case.fill")
                    }
                ProfileView(isLoggedOut: $authRepository.isLoggedOut).environmentObject(authRepository)
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            .accentColor(.white)
            .navigationDestination(isPresented: $authRepository.isLoggedOut) {
                AuthView()
            }

        }.navigationBarHidden(true)
    }
}
