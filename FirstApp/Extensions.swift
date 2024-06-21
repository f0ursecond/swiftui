//
//  Extensions.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 21/06/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
