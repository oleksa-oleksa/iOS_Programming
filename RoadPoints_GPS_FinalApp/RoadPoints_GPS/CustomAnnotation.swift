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
    var color: UIColor
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, color: UIColor) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.color = color
        
        super.init()
    }
}

extension MKPinAnnotationView {
    class func bluePinColor() -> UIColor {
        return UIColor.blue
    }
}
