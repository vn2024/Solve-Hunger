//
//  MapView.swift
//  MapApp
//
//  Created by Varsha Narasiman on 10/24/22.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
        if let annotation = annotationView.annotation {
            if annotation is MKUserLocation {
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters:  1200, longitudinalMeters:  1200)
                mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    
    let foodbanks: [Foodbank]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //
        updateAnnotation(from: uiView)
        
    }
    
    private func updateAnnotation(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.foodbanks.map(FoodbankAnnotation.init)
        mapView.addAnnotations(annotations)
    }


}
