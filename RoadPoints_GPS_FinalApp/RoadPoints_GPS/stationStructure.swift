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

let radiusWithBike = 300.0 // meters

// Array for all 6 stations
let stationsOnTheRoad = [station01, station02, station03,
                        station04, station05, station06, station07]
// Array for all 6 tasks
let stationsTask = ["Drink a small beer in Beergarten and read a newspapper",
                    "Borrow the new photo magazine from Museum",
                    "Buy a food for a kitten",
                    "Call a brother and tell again how wonderful Berlin is",
                    "Buy a new Sudoku for a beloved wife",
                    "Visit the Monkey bar and drink a fresh coffee",
                    "Listen to AC/DC"]

let stationTitle = ["Beergarten", "Museum for Photography",
                    "Lust Garten", "Lützowplatz",
                    "Schloss Bellevue", "Berlin Zoo", "Hard Rock Cafe"]

var customAnnotations: [CustomAnnotation] = []

func compareLocations(location: CLLocation) -> Int? {
    for (idx, thisLocation) in stationsOnTheRoad.enumerated() {
        let distance = haversineDinstance(la1: thisLocation.lat, lo1: thisLocation.lon, la2: location.coordinate.latitude, lo2: location.coordinate.longitude)
        if distance < radiusWithBike {
            return idx // the index of a corresponding station
        }
    }
    return nil // no index found
}

// STATIONS
// Beergarten
// Task: Drink a small beer in Beergarten and read a newspapper
let station01 = Station(lat: 52.518198,
                        lon: 13.380538,
                        radius: radiusWithBike)

// Museum für Fotografie
// Borrow the new photo magazine from Museum
let station02 = Station(lat: 52.508173,
                        lon: 13.331763,
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

// Hard Rock Cafe
// Task: Listen to AC/DC
let station07 = Station(lat: 52.503927,
                        lon: 13.333820,
                        radius: radiusWithBike)


