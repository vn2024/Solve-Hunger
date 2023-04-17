//
//  FoodbankAnnotation.swift
//  MapApp
//
//  Created by Varsha Narasiman on 10/24/22.
//

import Foundation
import MapKit
import UIKit

final class FoodbankAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(foodbank: Foodbank) {
        self.title = foodbank.name
        self.coordinate = foodbank.coordinate
    }
}
