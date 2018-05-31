//: Created by Oleksandra Baga 31.05.2018
/* Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope. */
import UIKit
/* TASK:
 If the call parameter of the function is True, it should return a function that returns, n * 2, where n is its parameter.
 Otherwise, it should provide an identity function that returns n for any number n (f (n) = n). */

func fMySwiftness(number: Bool) -> (Int) -> Int {
    func powerTwo(input: Int) -> Int {
        return input * input
    }
    func identity(input: Int) -> Int {
        return input
    }
    return number ? powerTwo : identity
}

// TEST CASES
var currentValue = 10
// makeMath now refers to the nested powerTwo() function
while currentValue > 0 {
    let fMyFunction = fMySwiftness(number: currentValue > 5)
    let result = fMyFunction(currentValue)
    print("\(currentValue) => \(result)")
    currentValue = currentValue - 1
}
print("zero!")
