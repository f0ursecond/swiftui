//
//  RegisterView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 12/05/24.
//

import AlertToast
import SwiftUI

struct LoginView: View {
    @Binding var currentShowingView: String
    @EnvironmentObject var authRepository: AuthRepository

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginClicked: Bool = false
    @State private var showToast = false
    @State private var showValidator = false

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, content: {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 6)

                Text("Masukan username dan password untuk menggunakan aplikasi ini")
                    .font(.system(size: 14))
                    .padding(.vertical, 8)

                TextField(
                    "Username",
                    text: $username
                )
                .foregroundColor(.black)
                .disableAutocorrection(true)
                .overlay(alignment: .trailing, content: {
                    ZStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.black)
                    }
                })
                .autocapitalization(.none)
                .padding(.all, 12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )

                SecureField(
                    "Password",
                    text: $password
                )
                .overlay(alignment: .trailing, content: {
                    ZStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.black)
                    }
                })
                .foregroundColor(.black)
                .autocapitalization(.none)
                .padding(.all, 12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.bottom, 10)

                Button(action: {
                    UIApplication.shared.endEditing()
                    if username.isEmpty || password.isEmpty {
                        showValidator = true
                    } else {
                        if !authRepository.isLoading {
                            authRepository.login(username: username, password: password)
                            showToast = true
                        }
                    }
                }) {
                    Text(authRepository.isLoading ? "Loading" : "Masuk")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                        .padding(.all, 12)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                .buttonStyle(PlainButtonStyle())
                .background(Color(hex: "#29166F"))
                .cornerRadius(10)
                .padding(.bottom, 10)

                HStack(content: {
                    Spacer()
                    Text("Don't have an account?")
                        .font(.caption)
                    Button {
                        withAnimation {
                            self.currentShowingView = "signup"
                        }
                    } label: {
                        Text("Register")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                })

                Spacer()
            })
            .foregroundColor(Color.black.opacity(0.7))
            .padding()
            .navigationDestination(isPresented: $authRepository.isLoggedIn) {
                NavigationBar().navigationBarBackButtonHidden(true)
            }
            .toolbar(.hidden)

        }.toast(isPresenting: $showToast, duration: 0, tapToDismiss: true) {
            if let errorMessage = authRepository.errorMessage {
                return AlertToast(
                    displayMode: .banner(.slide),
                    type: .error(.red),
                    title: "Oppss!!!",
                    subTitle: "Error \(authRepository.statusCode!) | \(errorMessage)"
                )
            } else if let token = authRepository.token {
                return AlertToast(
                    displayMode: .banner(.slide),
                    type: .complete(.green),
                    title: "Login Success",
                    subTitle: "Welcome \(username)"
                )
            } else {
                return AlertToast(
                    displayMode: .banner(.slide),
                    type: .regular,
                    title: "Loading",
                    subTitle: "Please Wait"
                )
            }
        }.toast(isPresenting: $showValidator) {
            AlertToast(
                displayMode: .banner(.slide),
                type: .error(.red),
                title: "Oppss!!!",
                subTitle: "All fields must be filled to log in"
            )
        }
    }
}
