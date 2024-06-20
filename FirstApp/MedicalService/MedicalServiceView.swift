//
//  MedicalServiceView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 26/05/24.
//

import SwiftUI

struct MedicalServiceView: View {
    @EnvironmentObject var repository: MedicalServiceRepository

    var body: some View {
        VStack(content: {
            HStack(content: {
                Text("Jasa Medis")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Spacer()
            }).padding(.top, 6)
            Divider()
                .padding(.bottom, 4)
            ZStack {
                if repository.isLoading {
                    VStack {
                        Spacer()
                        ProgressView()
                            .padding()
                        Spacer()
                    }
                } else if let errorMessage = repository.errorMessage {
                    VStack {
                        Spacer()
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                        Spacer()
                    }
                } else {
                    if repository.medicalServices.isEmpty {
                        VStack(content: {
                            Spacer()
                            Text("Data Is Empty")
                            Spacer()
                        })
                    } else {
                        ScrollView(content: {
                            VStack(alignment: .leading, content: {
                                ForEach(repository.medicalServices) { data in
                                    HStack(alignment: .top) {
                                        Text("\(data.id)")

                                        VStack(alignment: .leading) {
                                            Text(data.name)
                                                .bold()
                                        }
                                    }
                                    .frame(width: 300, alignment: .leading)
                                    .padding()
                                    .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                                    .cornerRadius(20)
                                }
                            })
                        })
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }).onAppear {
            repository.getMedicalService()
        }.padding(.horizontal, 24).padding(.vertical)
    }
}
