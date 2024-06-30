//
//  AuthRepository.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 20/06/24.
//

import Alamofire
import Foundation
import SwiftyJSON

class AuthRepository: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var token: String? {
        didSet {
            self.isLoggedIn = self.token != nil && !self.token!.isEmpty
            self.isLoggedOut = self.token == nil && self.token!.isEmpty
        }
    }

    @Published var statusCode: Int? = nil
    @Published var isLoggedIn = false
    @Published var isLoggedOut = false

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
                            let json = try JSON(data: data!)
                            
                            if let tokenResponse = json["token"].string {
                                self.token = tokenResponse
                                UserDefaults.standard.setValue(tokenResponse, forKey: "token")
                            } else if let msg = json["msg"].string {
                                self.errorMessage = msg
                                self.statusCode = resp.response?.statusCode
                            } else {
                                self.errorMessage = "Error response format"
                                self.statusCode = resp.response?.statusCode
                            }
                            
                        } catch {
                            self.errorMessage = "\(error)"
                        }
                    case .failure(let error):
                        if let data = resp.data {
                            do {
                                let json = try JSON(data: data)
                                
                                if let message = json["msg"].string {
                                    self.errorMessage = message
                                    self.statusCode = resp.response?.statusCode
                                } else {
                                    self.errorMessage = "\(error)"
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
    
