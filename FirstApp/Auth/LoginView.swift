//
//  RegisterView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 12/05/24.
//

import AlertToast
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authRepository: AuthRepository

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginClicked: Bool = false
    @State private var showToast = false
    @State private var showValidator = false

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, content: {
                Text("Masukan username dan password untuk menggunakan aplikasi ini")
                    .font(.system(size: 14))
                    .padding(.vertical, 8)

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
                .cornerRadius(50)
                Spacer()
                NavigationLink(
                    destination: NavigationBar().navigationBarBackButtonHidden(true),
                    isActive: $authRepository.isLoggedIn,
                    label: { EmptyView() }
                )
                .hidden()
            })
            .foregroundColor(Color.black.opacity(0.7))
            .padding()
            .navigationTitle("Masuk")

        }.toast(isPresenting: $showToast, duration: 10, tapToDismiss: true) {
            if let errorMessage = authRepository.errorMessage {
                return AlertToast(
                    displayMode: .banner(.slide),
                    type: .error(.red), title: "Error",
                    subTitle: "Error \(authRepository.statusCode!) | \(errorMessage)"
                )
            } else if let token = authRepository.token {
                return AlertToast(
                    displayMode: .banner(.pop), type: .complete(.green),
                    title: "Login Success",
                    subTitle: "Welcome \(username)"
                )
            } else {
                return AlertToast(
                    displayMode: .banner(.slide),
                    type: .regular,
                    title: "Loading",
                    subTitle: "Please Wait A Moment"
                )
            }
        }.toast(isPresenting: $showValidator) {
            AlertToast(
                displayMode: .banner(.slide),
                type: .error(.red),
                title: "Please Fill The Form"
            )
        }
    }
}
