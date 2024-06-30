//
//  AuthView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 28/06/24.
//

import SwiftUI

struct AuthView: View {
    @StateObject var authRepository = AuthRepository()
    @State private var currentShowing = "login" // login or signup

    var body: some View {
        if currentShowing == "login" {
            LoginView(currentShowingView: $currentShowing)
                .environmentObject(authRepository)
        } else {
            RegisterView(currentShowingView: $currentShowing)
                .transition(.move(edge: .bottom))
        }
    }
}
