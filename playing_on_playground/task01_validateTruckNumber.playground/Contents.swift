//: Playground - noun: a place where people can play

import UIKit

/*********************************/
// TASK 1: Validate the transport number
 /*********************************/

enum Vehicle {

    case auto(String)
    case truck(String, Int, Int)
}

func plausibilityTest(testVehicle: Vehicle) {
    switch testVehicle {
    case .auto(let serialNumber):
        if (testSerialNumber(serialNumber: serialNumber)) {
            print("Valid Auto Instance!\n")
        }
        else {
            print("Invalid Auto Instance!\n")
        }
    case .truck(let serialNumber, let axle, let totalWeight):
        if (testSerialNumber(serialNumber: serialNumber)) {
            if testTruckProperties(axle: axle, totalWeight: totalWeight) {
                print("Valid Truck Instance!\n")
            }
        }
        else {
            print("Invalid Truck Instance!\n")
        }
    }
}

func testSerialNumber(serialNumber: String) -> Bool {
    var isCorrectString:Bool = true
    
    // check the length of the serial number
    if serialNumber.count != 12 {
        return false
    }
    
    // check the characters
    for i in serialNumber {
        if i >= "0" && i <= "9" {
            isCorrectString = true
        }
        else if i >= "a" && i <= "z" {
            isCorrectString = true
        }
        else if i >= "A" && i <= "Z" {
            isCorrectString = true
        }
        else {
            return false
        }
    }
    // extra case: String can not contain a substring "WBABA"
    if serialNumber.range(of:"WBABA") != nil {
        isCorrectString = false
    }
    
    return isCorrectString
}

func testTruckProperties(axle: Int, totalWeight: Int) -> Bool {
    
    if axle == 1 && totalWeight > 2000 {
        return false
    }
    return true
}



/*********************************/
// TEST CASES FOR TASK 1:
var testItem01 = Vehicle.auto("123456789112") // valid
var testItem02 = Vehicle.auto("Y23456789abc") // valid
var testItem03 = Vehicle.auto("12sfWBABAfjg") // invalid: WBABA
var testItem04 = Vehicle.auto("12§67fg%fgd1") // invalid: special characters

var testArray = [testItem01, testItem02, testItem03, testItem04]

for i in testArray {
    plausibilityTest(testVehicle: i)
}
