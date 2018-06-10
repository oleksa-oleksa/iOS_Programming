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
let stationsTask = ["Buy a pinta of a craft beer",
                    "Borrow the new engineering magazine \"Make\" from Uni Library",
                    "Buy a food for a kitten",
                    "Do some sport",
                    "Buy a new Sudoku for a beloved wife",
                    "Visit the Monkey bar and drink a fresh coffee"]

var foundLocation = [0, 0, 0, 0, 0, 0]

func compareLocations(location: CLLocation) -> Int {
    for (idx, thisLocation) in stationsOnTheRoad.enumerated() {
        let distance = haversineDinstance(la1: thisLocation.lat, lo1: thisLocation.lon, la2: location.coordinate.latitude, lo2: location.coordinate.longitude)
        if distance < radiusWithBike {
            foundLocation[idx] = 1
            return idx + 1 // the index of a corresponding station
        }
        else {
            foundLocation[idx] = 0
        }
    }
    return 0 // no index found
}

// STATIONS
// Vagabung Brewery
// Task: Buy a pinta of a craft beer
let station01 = Station(lat: 52.546254,
                        lon: 13.350635,
                        radius: radiusWithBike)

// Technical University Berlin
// Task: Borrow the new engineering magazine "Make" from Uni Library
let station02 = Station(lat: 52.510038,
                        lon: 13.338477,
                        radius: radiusWithBike)

// Petshop
// Task: Buy a food for a kitten
let station03 = Station(lat: 52.491482,
                        lon: 13.297582,
                        radius: radiusWithBike)
// Superfit
// Task: Do some sport
let station04 = Station(lat: 52.458683,
                        lon: 13.34482,
                        radius: radiusWithBike)

// U-Bahn Kurfürstendamm
// Task: Buy a new Sudoku for a beloved wife
let station05 = Station(lat: 52.503159,
                        lon: 13.331907,
                        radius: radiusWithBike)
// Berlin Zoo
// Task: Visit the Monkey bar and drink a fresh coffee
let station06 = Station(lat: 52.507323,
                        lon: 13.336106,
                        radius: radiusWithBike)



