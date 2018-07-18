import UIKit

let point01 = (1, -1)
let point02 = (5, 5)
let point03 = (23, -17)

var point = point01
//point = point02
//point = point03


switch point {
case let (x, y) where x == y:
    print("\(x), \(y) is on the line x == y")
case let (x, y) where x == -y:
    print("\(x), \(y) is on the line x == -y")
case let (x, y):
    print("\(x), \(y) is just some arbitrary point")
}


