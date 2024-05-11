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
    @State private var password: String = ""
    @State private var isActive: Bool = false
    @State private var showAlert: Bool = false
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, content: {
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 6)
                Text("Please Fill The Form To Continue Register").font(.system(size: 12)).padding(.bottom, 20)

                TextField(
                    "Username",
                    text: $username
                ).disableAutocorrection(true).padding(.bottom, 10).textFieldStyle(.roundedBorder).autocapitalization(.none)
                TextField(
                    "Email",
                    text: $email
                ).padding(.bottom, 15).textFieldStyle(.roundedBorder).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                TextField("Password", text: $password).disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/).padding(.bottom, 10).textFieldStyle(.roundedBorder).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                Button(action: {
                    if !username.isEmpty && !email.isEmpty && !password.isEmpty {
                        isActive = true
                    } else {
                        showAlert = true
                    }

                }) {
                    Text("Register")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                        .padding(.all, 8)
                        .fontWeight(.regular)
                        .font(.system(size: 14))
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .background(backgroundColor)
                        .cornerRadius(12)
                }
                HStack(content: {
                    Spacer()
                    Text("Already Have An Account ?").font(.system(size: 14))
                    Button(action: {}) {
                        Text("Login").font(.system(size: 14))
                    }
                }).padding(.top, 16)

                NavigationLink(
                    destination: RegisterView(),
                    isActive: self.$isActive,
                    label: { EmptyView() }
                ).hidden()

            })
            .padding()
            .enableInjection()
        }.alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Oppss"),
                message: Text("Please Fill The Form First !!!"),
                dismissButton: .default(Text("Okay"), action: {
                    // Action when OK button is tapped
                    print("OK tapped")
                })
            )
        })
    }
    
    private var backgroundColor:Color {
        if colorScheme == .dark {
            return Color.white
        } else {
            return Color.black
        }
    }
    
    
}
