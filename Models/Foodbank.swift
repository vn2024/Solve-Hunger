//
//  Foodbank.swift
//  SolveHunger
//
//  Created by Varsha Narasiman on 10/25/22.
//

//
//  Foodbank.swift
//  MapApp
//
//  Created by Varsha Narasiman on 10/24/22.
//

import Foundation
import MapKit

struct Foodbank: Identifiable {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
    
}
