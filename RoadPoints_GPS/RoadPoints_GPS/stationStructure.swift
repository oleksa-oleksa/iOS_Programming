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

let radiusWithBike = 0.25 // meters

// Array for keepeng all 6 stations

let stationsOnTheRoad = [station01, station02, station03,
                        station04, station05, station06]

// STATIONS

// Vagabung Brewery
// Task: Buy a pinta of a craft beer
let station01 = Station(lat: 52.546254,
                        lon: 13.350635,
                        radius: radiusWithBike)

// Technical University Berlin
// Task: Borrow the new exemplar of engineering magazine "Make"
let station02 = Station(lat: 52.510038,
                        lon: 13.338477,
                        radius: radiusWithBike)

// Petshop
// Task: Buy a food fot a kitten
let station03 = Station(lat: 52.491482,
                        lon: 13.297582,
                        radius: radiusWithBike)
// Superfit
// Task: Do some sport
let station04 = Station(lat: 52.458683,
                        lon: 13.34482,
                        radius: radiusWithBike)

// U-Bahn Kurfürstendamm
// Task: Buy a new Sudoku fot a beloved wife
let station05 = Station(lat: 52.503159,
                        lon: 13.331907,
                        radius: radiusWithBike)
// Berlin Zoo
// Task: Visit the Monkey bar and drink a fresh coffee
let station06 = Station(lat: 52.507323,
                        lon: 13.336106,
                        radius: radiusWithBike)
