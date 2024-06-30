//
//  ProfileView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import AlertToast
import Inject
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authRepository: AuthRepository
    @Binding var isLoggedOut: Bool

    let dates = ["12-16 September 2024", "17-23 Oktober 2024", "23-30 Desember 2024"]
    let practiceSchedules: [PracticeSchedule] = [
        PracticeSchedule(day: "Senin", time: "20:00"),
        PracticeSchedule(day: "Selasa", time: "12:00"),
        PracticeSchedule(day: "Rabu", time: "19:00"),
        PracticeSchedule(day: "Kamis", time: "19:00"),
        PracticeSchedule(day: "Jumat", time: "20:00")
    ]
    @State private var isLogoutClicked: Bool = false

    var body: some View {
        VStack(content: {
            HStack(content: {
                Text("Profil")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Spacer()
                Image("Logout")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .onTapGesture {
                        UserDefaults.standard.removeObject(forKey: "token")
                        authRepository.isLoggedIn = false
                        isLoggedOut = true
                        authRepository.isLoggedOut = true
                        self.isLogoutClicked = true
                    }
            }).padding(.top, 6)
            Divider()
                .padding(.bottom, 4)

            Circle()
                .fill(.blue)
                .frame(width: 80, height: 80)

            Text("Dr. Bambang, SPKG")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.bottom, 2)
            Text("Spesialis Konservasi Gigi")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundStyle(Color(hex: "#46444E"))
                .padding(.bottom, 2)
            Text("33143.50242/DS.011/02/429.1/0105/II/2017")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundStyle(Color(hex: "#46444E"))
                .padding(.bottom, 20)

            HStack(alignment: .center, content: {
                Text("Jadwal Cuti")
                    .fontWeight(.semibold)
                Spacer()
            })

            DisclosureGroup("Lihat Cuti Saya", content: {
                VStack(content: {
                    Rectangle()
                        .fill(Color(hex: "#FEEDEC")).frame(height: 30)
                        .overlay(content: {
                            Text("Tanggal Cuti")
                                .foregroundStyle(Color(.red))
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                        })

                    if dates.isEmpty {
                        Text("Tidak Ada Jadwal Cuti")
                    } else {
                        VStack(content: {
                            ForEach(dates, id: \.self) { date in
                                Text(date)
                                    .font(.system(size: 12))
                                    .foregroundStyle(Color(.black))
                                    .padding(.bottom, 4)
                            }
                        })
                    }

                })
            })

            .accentColor(Color(.black).opacity(10))

            Divider()

            HStack(alignment: .center, content: {
                Text("Jadwal Praktek Anda")
                    .fontWeight(.semibold)
                Spacer()
            })

            DisclosureGroup("Klinik Gigi", content: {
                VStack(content: {
                    Rectangle()
                        .fill(Color(hex: "#180A4D")).frame(height: 30)
                        .overlay(content: {
                            HStack(content: {
                                Text("Hari")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                Spacer()
                                Text("Waktu").foregroundStyle(.white)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                            }).padding(.horizontal, 8)
                        })

                    if practiceSchedules.isEmpty {
                        Text("Tidak Ada Jadwal Praktek")
                    } else {
                        VStack(content: {
                            ForEach(practiceSchedules, id: \.self) { schedules in
                                HStack(content: {
                                    Text(schedules.day)
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color(.black))
                                        .padding(.bottom, 4)
                                    Spacer()
                                    Text(schedules.time)
                                        .font(.system(size: 12))
                                        .foregroundStyle(Color(.black))
                                        .padding(.bottom, 4)
                                }).padding(.horizontal, 8)
                            }.listRowInsets(.init(top: 0, leading: -8, bottom: 0, trailing: 0))
                        })
                    }

                })
            })

            .accentColor(Color(.black).opacity(10))

            Spacer()

        })
        .padding(.horizontal, 24).padding(.vertical)
        .toast(isPresenting: $isLogoutClicked, duration: 5, tapToDismiss: true) {
            AlertToast(
                displayMode: .banner(.pop), type: .complete(.green),
                title: "Selamat",
                subTitle: "Logout Sukses"
            )
        }
    }
}

struct PracticeSchedule: Hashable {
    var day: String
    var time: String
}
