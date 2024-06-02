//
//  OperationScheduleView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import Inject
import SwiftUI

struct OperationScheduleView: View {
    @ObserveInjection var inject
    @State private var currentDate = Date()
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(content: {
            Text(currentDate, format: .dateTime.hour().minute().second())
                .onReceive(timer) { input in
                    self.currentDate = input
                }
        }).enableInjection()
    }
}
