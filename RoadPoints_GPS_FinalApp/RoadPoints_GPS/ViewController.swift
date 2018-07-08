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
import AVFoundation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var trackLocation: UIButton!
    @IBOutlet weak var taskLabelBottomConstraint: NSLayoutConstraint!
    let locationManager:CLLocationManager = CLLocationManager()
    private var player: AVAudioPlayer?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currenLocation in locations {
            print("\(index): \(currenLocation)")
            
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
        if taskLabelBottomConstraint.constant != 20 {
            UIView.animate(withDuration: 0.75) {
                print("enable")
                self.taskLabelBottomConstraint.constant = 20
                self.view.layoutIfNeeded()
            }
            playSound(name: "Coin-collect-sound-effect")
        }
        customAnnotations[index].pinView?.pinTintColor = UIColor.blue
    }
    
    func disableTask(index: Int) {
        if taskLabelBottomConstraint.constant != -100 {
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.75, animations: {
                self.taskLabelBottomConstraint.constant = -100
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.taskLabel.text = ""
            })
        }
        customAnnotations[index].pinView?.pinTintColor = UIColor.red

    }
    
    func drawTaskLocation() {
        for (idx, location) in stationsOnTheRoad.enumerated() {
            
            mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            
            let coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
            
            let annotation = CustomAnnotation(coordinate: coordinate, title: stationTitle[idx], subtitle: stationTitle[idx], color: MKPinAnnotationView.bluePinColor())
            
            mapView.addAnnotation(annotation)
            
            // save custom annotations to the array
            customAnnotations.append(annotation)
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        taskLabelBottomConstraint.constant = -100
        
        trackLocation.layer.cornerRadius = 8

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10
        
        drawTaskLocation()
    }

    @IBAction func trackLocationButtonDidTap() {
        mapView.userTrackingMode = .follow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

