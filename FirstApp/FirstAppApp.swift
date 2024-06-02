//
//  FirstAppApp.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 11/05/24.
//

import SwiftUI

@main
struct FirstAppApp: App {
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white
        appearance.selectionIndicatorTintColor = UIColor.white
        appearance.shadowColor = .clear

        appearance.selectionIndicatorImage = UIImage()

        let selectedItemAppearance = appearance.stackedLayoutAppearance.selected
        selectedItemAppearance.iconColor = UIColor(Color(hex: "#29166F"))
        selectedItemAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color(hex: "#29166F"))]

        let unselectedItemAppearance = appearance.stackedLayoutAppearance.normal
        unselectedItemAppearance.iconColor = UIColor.gray
        unselectedItemAppearance.titleTextAttributes = [.foregroundColor: UIColor.gray]

        UITabBar.appearance().standardAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            NavigationBar()
        }
    }
}
