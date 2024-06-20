//
//  MedicalServiceRepository.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 18/06/24.
//

import Alamofire
import Foundation

class MedicalServiceRepository: ObservableObject {
    @Published var medicalServices: [ResMedicalService] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func getMedicalService() {
        let url = "https://65f10c06da8c6584131cc2e7.mockapi.io/api/message"
        self.isLoading = true
        self.errorMessage = nil

        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { resp in
                switch resp.result {
                    case .success(let data):
                        do {
                            let jsonData = try JSONDecoder().decode([ResMedicalService].self, from: data!)
                            self.medicalServices = jsonData
                            self.isLoading = false
                            debugPrint(jsonData)
                        } catch {
                            self.isLoading = false
                            self.errorMessage = error.localizedDescription
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        self.isLoading = false
                        self.errorMessage = error.localizedDescription
                        print(error.localizedDescription)
                }
            }
    }
}
