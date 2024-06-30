//
//  ContentView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 11/05/24.
//

import SwiftUI

struct RegisterView: View {
    @Binding var currentShowingView: String

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

                TextField(
                    "Email",
                    text: $email
                )
                .foregroundColor(.black)
                .disableAutocorrection(true)
                .overlay(alignment: .trailing, content: {
                    ZStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.black)
                    }
                })
                .autocapitalization(.none)
                .padding(.all, 12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )

                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .disableAutocorrection(true)
                    .overlay(alignment: .trailing, content: {
                        ZStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.black)
                        }
                    })
                    .autocapitalization(.none)
                    .padding(.all, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )

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
                    Text("Already Have An Account ?").font(.system(size: 12))
                    Button(action: {
                        withAnimation {
                            self.currentShowingView = "login"
                        }
                    }) {
                        Text("Login").font(.system(size: 12))
                    }
                }).padding(.vertical, 8)

//                NavigationLink(
//                    destination: HomeView().navigationBarBackButtonHidden(true),
//                    isActive: self.$isLoginButtonClicked,
//                    label: { EmptyView() }
//                )
//                .hidden()

                Spacer()

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
