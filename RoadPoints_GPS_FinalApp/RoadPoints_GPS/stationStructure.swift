//
//  stationStructure.swift
//  RoadPoints_GPS
//
//  Created by Oleksandra Baga on 07.06.18.
//  Copyright © 2018 Oleksandra Baga. All rights reserved.
//

import Foundation
import CoreLocation

struct Station {
    let lat: Double
    let lon: Double
    let radius: Double
}

let radiusWithBike = 250.0 // meters

// Array for all 6 stations
let stationsOnTheRoad = [station01, station02, station03,
                        station04, station05, station06]
// Array for all 6 tasks
let stationsTask = ["Drink a small beer in Beergarten and read a newspapper",
                    "Borrow the new engineering magazine \"Make\" from Uni Library",
                    "Buy a food for a kitten",
                    "Call a brother and tell again how wonderful Berlin is",
                    "Buy a new Sudoku for a beloved wife",
                    "Visit the Monkey bar and drink a fresh coffee"]

let stationTitle = ["Beergarten", "TU Berlin",
                    "Lust Garten", "Lützowplatz",
                    "Schloss Bellevue", "Berlin Zoo"]

var foundLocation = [0, 0, 0, 0, 0, 0]

var customAnnotations: [CustomAnnotation] = []

func compareLocations(location: CLLocation) -> Int {
    for (idx, thisLocation) in stationsOnTheRoad.enumerated() {
        let distance = haversineDinstance(la1: thisLocation.lat, lo1: thisLocation.lon, la2: location.coordinate.latitude, lo2: location.coordinate.longitude)
        if distance < radiusWithBike {
            foundLocation[idx] = 1
            return idx // the index of a corresponding station
        }
        else {
            foundLocation[idx] = 0
        }
    }
    return 0 // no index found
}

// STATIONS
// Beergarten
// Task: Drink a small beer in Beergarten and read a newspapper
let station01 = Station(lat: 52.518198,
                        lon: 13.380538,
                        radius: radiusWithBike)

// Technical University Berlin
// Task: Borrow the new engineering magazine "Make" from Uni Library
let station02 = Station(lat: 52.512922,
                        lon: 13.322592,
                        radius: radiusWithBike)

// Lust Garten
// Task: Buy a food for a kitten
let station03 = Station(lat: 52.517848,
                        lon: 13.399518,
                        radius: radiusWithBike)
// Lützowplatz
// Task: Call a brother and tell again how wonderful Berlin is
let station04 = Station(lat: 52.504930,
                        lon: 13.352332,
                        radius: radiusWithBike)

// Schloss Bellevue
// Task: Buy a new Sudoku for a beloved wife
let station05 = Station(lat: 52.517117,
                        lon: 13.354115,
                        radius: radiusWithBike)
// Berlin Zoo
// Task: Visit the Monkey bar and drink a fresh coffee
let station06 = Station(lat: 52.506037,
                        lon: 13.341518,
                        radius: radiusWithBike)



