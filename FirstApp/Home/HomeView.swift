//
//  HomeView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 19/05/24.
//

import Inject
import SwiftUI

struct HomeView: View {
    @ObserveInjection var inject
    @State private var counter: Int = 0
    let token = UserDefaults.standard.string(forKey: "token")

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false, content: {
                    VStack(alignment: .leading, content: {
                        Rectangle()
                            .fill(Color(hex: "#29166F"))
                            .frame(height: 180)
                            .overlay(
                                HStack(content: {
                                    VStack(alignment: .leading, content: {
                                        Text("dr. Bambang, SPKG")
                                            .font(.system(size: 20))
                                            .fontWeight(.regular)
                                            .foregroundColor(.white)
                                            .padding(.bottom, 4)
                                        Text("Spesialis Gigi Endodensi")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    })
                                    Spacer()
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 20))
                                        .padding(.trailing, 10)
                                })
                                .padding(.horizontal, 18)
                                .padding(.bottom, 24)
                            )
                            .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))

                        Spacer()
                    })
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .fill(.white)
                        .frame(height: 600)
                        .padding(.horizontal, 14)
                        .overlay(
                            VStack(content: {
                                CustomCard(data: CardModels(
                                    color: Color(hex: "#306BDD"),
                                    imagePath: "rawatJalan",
                                    title: "Rawat\nJalan",
                                    patientCount: 20
                                ))
                                CustomCard(data: CardModels(
                                    color: Color(hex: "#DD6430"),
                                    imagePath: "rawatInap",
                                    title: "Rawat\nInap",
                                    patientCount: 15
                                ))
                                CustomCard(data: CardModels(
                                    color: Color(hex: "#57BE83"),
                                    imagePath: "jadwalOperasi",
                                    title: "Jadwal\nOperasi",
                                    patientCount: 10
                                )).padding(.bottom, 12)

                                AttendanceWidget()

                                Spacer()
                            })
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                        ).offset(y: -70)
                })

            }.edgesIgnoringSafeArea(.top)
        }.onAppear {
            if token != nil {
                print(token)
            } else {
                print("token null")
            }

        }.navigationBarHidden(true)
    }
}
