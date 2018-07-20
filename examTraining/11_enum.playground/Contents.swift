import UIKit

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let one = ArithmeticExpression.number(1)
let two = ArithmeticExpression.number(2)
let ten = ArithmeticExpression.number(10)

let three = ArithmeticExpression.addition(one, two)
let onePlusTwoPlusTen = ArithmeticExpression.addition(three, ten)

//=================================
struct Point {
    var x = 0.0, y = 0.0
}

var somePoint = Point()
somePoint.x = 7.0

//=================================
// Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1
        
    }
    func stepBackward(input: Int) -> Int { return input - 1
        
    }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


//=================================
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()

incrementByTen()
alsoIncrementByTen()
alsoIncrementByTen()

incrementByTen()

let newInc = incrementByTen
newInc()
