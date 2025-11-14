//
//  MapView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 10/11/25.
//

import SwiftUI
import MapKit
import UIKit





struct MapView: View {
    @State private var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 1.3521_051, longitude: 103.822872),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    class ViewController: UIViewController {

        @IBOutlet weak var mapView: MKMapView!

        override func viewDidLoad() {
            super.viewDidLoad()

            let pinAnnotation = MKPointAnnotation()

            pinAnnotation.coordinate = CLLocationCoordinate2D(latitude: 1.4156, longitude: 103.8667)

            pinAnnotation.title = "seletar airport"
            mapView.addAnnotation(pinAnnotation)

        }
    }

        var body: some View {
        Map(coordinateRegion: $region)
            
        }

}



#Preview {
    MapView()
}
