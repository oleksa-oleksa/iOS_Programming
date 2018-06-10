//
//  ViewController.swift
//  RoadPoints_GPS
//
//  Created by Oleksandra Baga on 07.06.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager:CLLocationManager = CLLocationManager()
    var color:UIColor?
    var green:UIColor = UIColor(red: 113.0/255.0, green:
        165.0/255.0, blue: 29.0/255.0, alpha: 1.0)
    
    // Labels for graphic stations
    @IBOutlet weak var station01: UILabel!
    @IBOutlet weak var station02: UILabel!
    @IBOutlet weak var station03: UILabel!
    @IBOutlet weak var station04: UILabel!
    @IBOutlet weak var station05: UILabel!
    @IBOutlet weak var station06: UILabel!
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currenLocation in locations {
            print("\(index): \(currenLocation)")
            let foundIdx = compareLocations(location: currenLocation)
            if foundIdx != 0 {
                activateLocation(index: foundIdx)
            }
        }
    }
    
    func activateLocation(index: Int) {
        switch index {
        case 1:
            station01.text = stationsTask[0]
        case 2:
            station02.text = stationsTask[1]
        case 3:
            station03.text = stationsTask[2]
        case 4:
            station04.text = stationsTask[3]
        case 5:
            station05.text = stationsTask[4]
        case 6:
            station06.text = stationsTask[5]
        default:
            station01.text = "Station 1"
            station02.text = "Station 2"
            station03.text = "Station 3"
            station04.text = "Station 4"
            station05.text = "Station 5"
            station06.text = "Station 6"

        }
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

