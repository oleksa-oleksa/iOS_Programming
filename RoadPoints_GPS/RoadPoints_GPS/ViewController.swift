//
//  ViewController.swift
//  RoadPoints_GPS
//
//  Created by Oleksandra Baga on 07.06.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var taskLabel: UILabel!
    let locationManager:CLLocationManager = CLLocationManager()
    
    var color:UIColor?
    var green:UIColor = UIColor(red: 113.0/255.0, green:
        165.0/255.0, blue: 29.0/255.0, alpha: 1.0)
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currenLocation in locations {
            print("\(index): \(currenLocation)")
            
            let center =  currenLocation.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: center, span: span)
            
            // show current lication on the map
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
            
            // Check if the location inside the radius
            let foundIdx = compareLocations(location: currenLocation)
            if foundIdx != 0 {
                activateTask(index: foundIdx)
            }
            else {
                disableTask(index: foundIdx)
            }
        }
    }
    
    func activateTask(index: Int) {
        taskLabel.text = stationsTask[index]
        customAnnotations[index].pinView?.pinTintColor = UIColor.blue
    }
    
    func disableTask(index: Int) {
        taskLabel.text = ""
        customAnnotations[index].pinView?.pinTintColor = UIColor.red

    }
    
    func drawTaskLocation() {
        for (idx, location) in stationsOnTheRoad.enumerated() {
            
            mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            
            let coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
            
            let annotation = CustomAnnotation(coordinate: coordinate, title: stationTitle[idx], subtitle: stationTitle[idx], color: UIColor.red)
            
            mapView.addAnnotation(annotation)
            
            // save custom annotations to the array
            customAnnotations.append(annotation)
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10
        
        drawTaskLocation()
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

