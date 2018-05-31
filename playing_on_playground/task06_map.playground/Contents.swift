//: Created by Oleksandra Baga
import UIKit
/* TASK: Differens small tasks with map()
 map(_:) Returns an array containing the results of mapping the given closure over the sequence’s elements.
 */

// Part a
let myArray = [1, 2, 3, 4]
let multWithTwo = myArray.map{$0*10}
for element in multWithTwo {
    print(element)
}

// Part b
func translateNumberInGerman(number: Int) -> String {
    let germanNumbers = ["null", "eins", "zwei", "drei", "vier", "funf", "sechs", "sieben", "acht", "neun", "zehn"]
    return germanNumbers[number]
}

let germanNumbers = myArray.map(translateNumberInGerman)
for element in germanNumbers {
    print(element)
}

// Part c
let myBoolArray = [true, false, false, true]

func getIntBool(textBool: Bool) -> Int {
    if (textBool){
        return 1
    }
    else {
        return 0
    }
}

let myNumBooleans = myBoolArray.map(getIntBool)
for element in myNumBooleans {
    print(element)
}
