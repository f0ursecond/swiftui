//
//  PresenceView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import SwiftUI

struct PresenceView: View {
    @State private var presenceList: [ResPresence] = [
        ResPresence(id: 1, date: "12/04/2004", presenceIn: "13:07", presenceOut: "14:12", status: "Terlambat"),
        ResPresence(id: 2, date: "12/08/2004", presenceIn: "13:07", presenceOut: "14:24", status: "Terlambat"),
        ResPresence(id: 3, date: "12/05/2003", presenceIn: "13:07", presenceOut: "14:11", status: "Tidak Terlambat"),
        ResPresence(id: 4, date: "12/01/2004", presenceIn: "13:07", presenceOut: "14:25", status: "Terlambat"),
        ResPresence(id: 5, date: "18/05/2003", presenceIn: "09:07", presenceOut: "17:02", status: "Tidak Terlambat")
    ]

    var body: some View {
        VStack(alignment: .leading, content: {
            HStack(alignment: .center, content: {
                Text("Presensi")
                    .font(.system(size: 24)).bold()
                Spacer()
            }).padding(.bottom, 4)

            Text("Senin, 4 September 2024 | 09:32")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .padding(.bottom, 8)

            HStack(content: {
                VStack(alignment: .leading, content: {
                    Text("Riwayat Presensi")
                        .fontWeight(.semibold)
                    Text("7 Hari Terakhir")
                })
                Spacer()
                Text("Lihat Semua")
                    .font(.system(size: 12))
                    .onTapGesture {
                        print("clicked")
                    }.foregroundColor(.blue)
            })

            List(presenceList) { data in
                PresenceItemWidget(data:
                    ResPresence(
                        id: data.id,
                        date: data.date,
                        presenceIn: data.presenceIn,
                        presenceOut: data.presenceOut,
                        status: data.status
                    ))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)

            Spacer()
        })
        .padding(.horizontal, 24)
        .padding(.top, 14)
    }
}
