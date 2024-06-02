//
//  AttendanceWidget.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import SwiftUI

struct AttendanceWidget: View {
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .fill(Color(hex: "#F5F5F5"))
            .frame(height: 224)
            .overlay(content: {
                VStack(content: {
                    HStack(content: {
                        Text("Kehadiran Dokter")
                            .font(.system(size: 16))
                            .bold()
                        Spacer()
                        Image(systemName: "info.circle")
                            .foregroundColor(Color(hex: "#5B5964"))

                    }).padding(.bottom, 12)

                    Button(action: {
                        print("clicked")
                    }) {
                        Text("Presensi Masuk")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                            .padding(.all, 12)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(Color(hex: "#29166F"))
                    .cornerRadius(50)
                    .padding(.bottom, 12)

                    HStack(content: {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .fill(.white)
                            .frame(width: 146, height: 97)
                            .overlay(content: {
                                VStack(alignment: .leading, content: {
                                    HStack(content: {
                                        RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                            .fill(Color(hex: "#1E9852"))
                                            .frame(width: 32, height: 32)
                                            .overlay(content: {
                                                Image("Login")
                                                    .foregroundColor(.white)
                                            })
                                        Text("Absen Masuk")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(hex: "#1E9852"))
                                    }).padding(.bottom, 12)

                                    Text("06:55 WIB")
                                        .font(.system(size: 20, weight: .bold))
                                })
                            })
                        Spacer()
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .fill(.white)
                            .frame(width: 146, height: 97)
                            .overlay(content: {
                                VStack(alignment: .leading, content: {
                                    HStack(content: {
                                        RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                            .fill(Color(hex: "#BA3434"))
                                            .frame(width: 32, height: 32)
                                            .overlay(content: {
                                                Image("Logout")
                                                    .foregroundColor(.white)
                                            })
                                        Text("Absen Keluar")
                                            .font(.system(size: 12))
                                            .foregroundColor(.red)
                                    }).padding(.bottom, 12)

                                    Text("14:55 WIB")
                                        .font(.system(size: 20, weight: .bold))
                                })
                            })
                    })
                })
                .padding(.horizontal, 12)
                .padding(.vertical, 15)
            })
    }
}
