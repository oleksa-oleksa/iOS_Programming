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


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var trackLocation: UIButton!
    @IBOutlet weak var taskLabelBottomConstraint: NSLayoutConstraint!
    let locationManager:CLLocationManager = CLLocationManager()
    private var player: AVAudioPlayer?
    private var currentTaskIdx: Int?
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currenLocation in locations {
            print("\(index): \(currenLocation)")
            
            // Check if the location inside the radius
            if let foundIdx = compareLocations(location: currenLocation) {
                activateTask(index: foundIdx)
            }
            else {
                disableTask()
            }
        }
    }
    
    func activateTask(index: Int) {
        if index == currentTaskIdx {
            return
        }
        
        currentTaskIdx = index
        taskLabel.text = stationsTask[index]
        UIView.animate(withDuration: 0.75) {
            self.taskLabelBottomConstraint.constant = 20
            self.view.layoutIfNeeded()
        }
        playSound(name: "Coin-collect-sound-effect")
        
        drawTaskLocation()
    }
    
    func disableTask() {
        if currentTaskIdx == nil {
            return
        }
        
        UIView.animate(withDuration: 0.75, animations: {
            self.taskLabelBottomConstraint.constant = -100
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.taskLabel.text = ""
        })
        
        self.currentTaskIdx = nil
        
        drawTaskLocation()
    }
    
    func drawTaskLocation() {
        for (idx, location) in stationsOnTheRoad.enumerated() {
            
//            mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            
            let coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
            
            let color = idx == currentTaskIdx ? MKPinAnnotationView.redPinColor() : MKPinAnnotationView.bluePinColor()
            let annotation = CustomAnnotation(coordinate: coordinate, title: stationTitle[idx], subtitle: stationTitle[idx], color: color)
            
            mapView.addAnnotation(annotation)
            
            // save custom annotations to the array
            customAnnotations.append(annotation)
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        trackLocation.isHidden = true
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        taskLabelBottomConstraint.constant = -100
        
        trackLocation.layer.cornerRadius = 8

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10
        
        mapView.delegate = self
        
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
    
    // MARK: MKMapViewDelegate

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let customAnnotation = annotation as? CustomAnnotation {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
            view.pinTintColor = customAnnotation.color
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        if mode == .none {
            trackLocation.isHidden = false
        } else {
            trackLocation.isHidden = true
        }
    }
    
}

