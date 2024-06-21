//
//  AuthRepository.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 20/06/24.
//

import Alamofire
import Foundation

class AuthRepository: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var token: String? {
        didSet {
            self.isLoggedIn = self.token != nil && !self.token!.isEmpty
        }
    }

    @Published var statusCode: Int? = nil
    @Published var isLoggedIn = false

    func login(username: String, password: String) {
        let url = "https://belajar-backend-okev.vercel.app/api/login"
        self.isLoading = true
        self.errorMessage = nil
        self.statusCode = nil
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
        ]
        
        let paremeters = [
            "username": username,
            "password": password,
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = true
            AF.request(url, method: .post, parameters: paremeters, encoding: JSONEncoding.default, headers: headers, interceptor: nil)
                .response { resp in
                    
                    self.isLoading = false
                    
                    switch resp.result {
                    case .success(let data):
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any], let token = json["token"] as? String {
                                self.token = token
                                self.errorMessage = nil
                            } else if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any], let msg = json["msg"] as? String {
                                self.errorMessage = "\(msg)"
                                self.statusCode = resp.response?.statusCode
                            }
                        } catch {
                            self.errorMessage = "\(error)"
                        }
                    case .failure(let error):
                        if let data = resp.data {
                            do {
                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                                   let message = json["msg"] as? String
                                {
                                    self.errorMessage = message
                                    self.statusCode = resp.response?.statusCode
                                } else {
                                    self.errorMessage = "An error occurred"
                                    self.statusCode = resp.response?.statusCode
                                }
                            } catch {
                                self.errorMessage = "\(error)"
                                self.statusCode = resp.response?.statusCode
                            }
                        } else {
                            self.errorMessage = "\(error)"
                            self.statusCode = resp.response?.statusCode
                        }
                    }
                    self.isLoading = false
                }
        }
    }
}
    
