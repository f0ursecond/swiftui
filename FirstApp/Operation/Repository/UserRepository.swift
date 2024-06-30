//
//  UserRepository.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 20/06/24.
//

import Alamofire
import Foundation

class UserRepository: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func getAllUsers() {
        self.isLoading = true
        self.errorMessage = nil

        AF.request("https://jsonplaceholder.typicode.com/users", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { resp in
                switch resp.result {
                    case .success(let data):
                        do {
                            let jsonData = try JSONDecoder().decode([UserModel].self, from: data!)
                            self.users = jsonData
                            self.isLoading = false
                        } catch {
                            self.isLoading = false
                            self.errorMessage = error.localizedDescription
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        self.isLoading = false
                        self.errorMessage = error.localizedDescription
                }
            }
    }
}
