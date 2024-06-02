//
//  RegisterView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 12/05/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginClicked: Bool = false

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, content: {
                Text("Masukan username dan password untuk menggunakan aplikasi dokter Rumah Sakit Roemani")
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
                    isLoginClicked = true
                    print("cokk jancok \(isLoginClicked)")
                }) {
                    Text("Masuk")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                        .padding(.all, 6)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                .background(.purple)
                .cornerRadius(10)
                Spacer()
                NavigationLink(
                    destination: HomeView().navigationBarBackButtonHidden(true),
                    isActive: $isLoginClicked,
                    label: { EmptyView() }
                )
                .hidden()
            })
            .foregroundColor(Color.black.opacity(0.7))
            .padding()
            .navigationTitle("Masuk")
        }
    }
}
