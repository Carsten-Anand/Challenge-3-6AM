//
//  MapView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 10/11/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 1.3521_051, longitude: 103.822872),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )

            var body: some View {
                Map(coordinateRegion: $region)
            }
}

#Preview {
    MapView()
}
