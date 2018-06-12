//  CustomAnnotation.swift
//  RoadPoints_GPS
//
//  Created by Oleksandra Baga on 12.06.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var pinView: MKPinAnnotationView?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, color: UIColor?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.pinView?.pinTintColor = color
        
        super.init()
    }
}
