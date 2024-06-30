//
//  PresenceAllView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/06/24.
//

import SwiftUI

struct PresenceAllView: View {
    @State private var presenceList: [ResPresence] = [
        ResPresence(id: 1, date: "12/04/2004", presenceIn: "13:07", presenceOut: "14:12", status: "Terlambat"),
        ResPresence(id: 2, date: "12/08/2004", presenceIn: "13:07", presenceOut: "14:24", status: "Terlambat"),
        ResPresence(id: 3, date: "12/05/2003", presenceIn: "13:07", presenceOut: "14:11", status: "Tidak Terlambat"),
        ResPresence(id: 4, date: "12/01/2004", presenceIn: "13:07", presenceOut: "14:25", status: "Terlambat"),
        ResPresence(id: 5, date: "18/05/2003", presenceIn: "09:07", presenceOut: "17:02", status: "Tidak Terlambat"),
        ResPresence(id: 6, date: "18/05/2003", presenceIn: "09:07", presenceOut: "17:02", status: "Tidak Terlambat"),
        ResPresence(id: 7, date: "18/05/2003", presenceIn: "09:07", presenceOut: "17:02", status: "Tidak Terlambat"),
        ResPresence(id: 8, date: "18/05/2003", presenceIn: "09:07", presenceOut: "17:02", status: "Terlambat"),
        ResPresence(id: 9, date: "18/05/2003", presenceIn: "09:07", presenceOut: "17:02", status: "Tidak Terlambat"),
    ]
    @State private var isDetailClicked = false
    @State private var wakeUp = Date.now
    @State private var calendarId: Int = 0
    @State private var selectedId: Int? = nil
    @State private var showDatePicker = false

    var body: some View {
        NavigationStack {
            VStack {
                List(presenceList) { data in
                    PresenceItemWidget(data:
                        ResPresence(
                            id: data.id,
                            date: data.date,
                            presenceIn: data.presenceIn,
                            presenceOut: data.presenceOut,
                            status: data.status
                        ), onTap: {
                            selectedId = data.id
                            isDetailClicked = true
                            showDatePicker = false
                        })
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)

                Spacer()

                NavigationLink("", isActive: $isDetailClicked, destination: {
                    PresenceDetailView(idPresence: selectedId ?? 0)
                }).isDetailLink(true)
            }
            .padding(.horizontal, 12)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                        .overlay {
                            DatePicker(
                                "",
                                selection: $wakeUp,
                                displayedComponents: [.date]
                            )
                            .opacity(isDetailClicked ? 0 : 1)
                            .id(calendarId)
                            .allowsHitTesting(true)
                            .blendMode(.sourceAtop)
                            .datePickerStyle(.compact)
                            .environment(\.locale, Locale(identifier: "id"))
                            .onChange(of: wakeUp, initial: true) { _, _ in
                                // TODO: call api with selected date
                                print("selected date \(formattedDate)")
                                calendarId += 1
                            }
                            .colorInvert()
                            .colorMultiply(.white)
                            .padding()
                        }
                })
            }
        }
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "id")
        return formatter.string(from: wakeUp)
    }
}
