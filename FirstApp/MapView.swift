//
//  MapView.swift
//  FirstApp
//
//  Created by Alif Zulfanur on 11/05/24.
//

import MapKit
import SwiftUI

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}
