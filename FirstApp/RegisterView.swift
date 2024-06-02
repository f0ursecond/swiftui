//
//  ContentView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 11/05/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRegisterButtonClicked: Bool = false
    @State private var isLoginButtonClicked: Bool = false
    @State private var showAlert: Bool = false
    @State private var showAlertSuccess: Bool = false

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
                ).disableAutocorrection(true)
                    .padding(.bottom, 10)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)

                TextField(
                    "Email",
                    text: $email
                ).padding(.bottom, 15).textFieldStyle(.roundedBorder).autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)

                SecureField("Password", text: $password)
                    .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)

                Button(action: {
                    self.showAlertSuccess = false
                    if username.isEmpty || email.isEmpty || password.isEmpty {
                        self.showAlertSuccess = false
                    } else {
                        showAlertSuccess = true
                    }
                    self.showAlert.toggle()
                }) {
                    Text("Register")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                        .padding(.all, 8)
                        .fontWeight(.regular)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                HStack(content: {
                    Spacer()
                    Text("Already Have An Account ?").font(.system(size: 12))
                    Button(action: {
                        isLoginButtonClicked = true
                    }) {
                        Text("Login").font(.system(size: 12))
                    }
                }).padding(.vertical, 8)

                NavigationLink(
                    destination: HomeView().navigationBarBackButtonHidden(true),
                    isActive: self.$isLoginButtonClicked,
                    label: { EmptyView() }
                )
                .hidden()

            })
            .padding()
        }
        .alert(isPresented: $showAlert, content: {
            if self.showAlertSuccess {
                Alert(
                    title: Text("Register Success!!!"),
                    message: Text("\(username) | \(email)"),
                    dismissButton: .default(Text("Okay"), action: {
                        print("OK tapped")
                    })
                )
            } else {
                Alert(
                    title: Text("Oppss!!!"),
                    message: Text("Please Fill The Form First!!!"),
                    dismissButton: .default(Text("Okay"), action: {
                        print("OK tapped")
                    })
                )
            }
        })
    }

    private var backgroundColor: Color {
        if colorScheme == .dark {
            return Color.white
        } else {
            return Color.black
        }
    }
}
