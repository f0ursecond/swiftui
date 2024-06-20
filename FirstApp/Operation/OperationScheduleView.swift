//
//  OperationScheduleView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import SwiftUI

struct OperationScheduleView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        VStack(content: {
            HStack(content: {
                Text("Jadwal Operasi")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Spacer()
            }).padding(.top, 6)
            Divider()
                .padding(.bottom, 4)
            ZStack {
                if network.isLoading {
                    VStack {
                        Spacer()
                        ProgressView()
                            .padding()
                        Spacer()
                    }
                } else if let errorMessage = network.errorMessage {
                    VStack {
                        Spacer()
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                        Spacer()
                    }
                } else {
                    if network.users.isEmpty {
                        VStack(content: {
                            Spacer()
                            Text("Data Is Empty")
                            Spacer()
                        })
                    } else {
                        ScrollView {
                            VStack(alignment: .leading) {
                                ForEach(network.users) { user in
                                    HStack(alignment: .top) {
                                        Text("\(user.id)")

                                        VStack(alignment: .leading) {
                                            Text(user.name)
                                                .bold()

                                            Text(user.email.lowercased())

                                            Text(user.phone)
                                        }
                                    }
                                    .frame(width: 300, alignment: .leading)
                                    .padding()
                                    .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                                    .cornerRadius(20)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }).onAppear {
            self.network.getUsersWithAlamofire()
        }.padding(.horizontal, 24).padding(.vertical)
    }
}
