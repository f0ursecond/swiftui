//
//  ContentView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 11/05/24.
//

import Inject
import SwiftUI

struct ContentView: View {
    @ObserveInjection var inject

    @State private var username: String = ""
    @State private var email: String = ""

    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 6)
            Text("Long Time No See").font(.system(size: 12)).padding(.bottom, 20)

            TextField(
                "Username",
                text: $username
            ).disableAutocorrection(true).padding(.bottom, 10).textFieldStyle(.roundedBorder)
            TextField(
                "Email",
                text: $email
            ).padding(.bottom, 15).textFieldStyle(.roundedBorder)
            Button(action: {
                
            }) {
                Text("Login")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                    .padding(.all,8)
                    .fontWeight(.regular)
                    .font(.title2)
                    .background(Color(.white))
                    .cornerRadius(12)
            }
            HStack(content: {
                Spacer()
                Text("Forgot Password?").font(.system(size: 14))
            }).padding(.top, 16)

        })
        .padding()
        .enableInjection()
    }
}
