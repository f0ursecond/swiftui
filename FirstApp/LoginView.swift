//
//  RegisterView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 12/05/24.
//

import Inject
import SwiftUI

struct LoginView: View {
    @ObserveInjection var inject

    @State private var username: String = ""
    @State private var password: String = ""

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ScrollView(content: {
            VStack(content: {
                Image("imgLogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 200, height: 200)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)

                Text("Welcome Back").padding(.bottom, 15)

                TextField(
                    "Username",
                    text: $username
                ).disableAutocorrection(true)
                    .padding(.bottom, 10)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)

                SecureField(
                    "Password",
                    text: $password
                )
                .textFieldStyle(.roundedBorder)
                .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 10)

                Button(action: {}) {
                    Text("Login")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                        .padding(.all, 8)
                        .fontWeight(.regular)
                        .font(.system(size: 14))
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .background(.white)
                        .cornerRadius(8)
                }

                HStack(content: {
                    Spacer()
                    Text("Dont't Have An Account ?").font(.system(size: 12))
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Register").font(.system(size: 12))
                    }
                }).padding(.vertical, 8)

            })
        }).preferredColorScheme(/*@START_MENU_TOKEN@*/ .dark/*@END_MENU_TOKEN@*/)
            .padding()
            .enableInjection()
    }
}
