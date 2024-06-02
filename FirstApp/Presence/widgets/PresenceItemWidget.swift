//
//  PresenceItemWidget.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import SwiftUI

struct PresenceItemWidget: View {
    var data: ResPresence
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .fill(.gray.opacity(0.1))
            .frame(height: 100)
            .listRowSeparator(.hidden)
            .overlay(content: {
                VStack(content: {
                    HStack(content: {
                        Text(data.date).font(.system(size: 14))
                        Spacer()
                        Text(data.status)
                            .foregroundStyle(data.status.contains("Tidak") ? .green : .red)
                            .font(.system(size: 10))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .background(Color(hex: data.status.contains("Tidak") ? "#D2FFD5" : "#FEEDEC"))
                            .cornerRadius(20)

                    }).padding(.horizontal, 10).padding(.bottom, 15)
                    HStack(alignment: .center, content: {
                        HStack(content: {
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .fill(.white)
                                .frame(width: 24, height: 24)
                                .overlay(content: {
                                    HStack(content: {
                                        Image("Login")
                                            .renderingMode(.template)
                                            .foregroundColor(.black)
                                    })
                                })
                            Text(data.presenceIn + " WIB").font(.system(size: 12))
                        })

                        HStack(content: {
                            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                .fill(.white)
                                .frame(width: 24, height: 24)
                                .overlay(content: {
                                    HStack(content: {
                                        Image("Logout")
                                            .renderingMode(.template)
                                            .foregroundColor(.black)
                                    })
                                })
                            Text(data.presenceOut + " WIB").font(.system(size: 12))
                        })
                        Spacer()
                    }).padding(.horizontal, 10)
                })
            })
    }
}

struct ResPresence: Identifiable {
    var id: Int
    var date: String
    var presenceIn: String
    var presenceOut: String
    var status: String
}
