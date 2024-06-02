//
//  CustomCard.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import SwiftUI

struct CustomCard: View {
    var data: CardModels

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(data.color)
            .frame(height: 100)
            .padding(.vertical, 4)
            .overlay(
                ZStack(alignment: .leading) {
                    Image(data.imagePath)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)

                    HStack {
                        Text(data.title)
                            .multilineTextAlignment(.center)
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 24)

                        Spacer()

                        VStack {
                            Text("\(data.patientCount)")
                                .fontWeight(.medium)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Text("Pasien")
                                .fontWeight(.regular)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 24)
                    }
                }
            )
    }
}
