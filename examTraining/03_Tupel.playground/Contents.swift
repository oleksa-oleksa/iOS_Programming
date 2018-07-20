import UIKit

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

var personalienJulia = ("Julia", 16, "Molkestr", 45)
var personalienTair = ("Tair", 17, "Marschenstr", 120)
var personen = [personalienJulia, personalienTair]

personalienTair.2 = "Kürfürsterdamm"
personalienTair.3 = 10

for personalie in personen {
    print("Name: \(personalie.0), Alter: \(personalie.1), Straße: \(personalie.2), Nummer: \(personalie.3)")
}

//===========================
let myConstF = { (a: Int, b: Int) -> Int in a + b}


let myConstI = { (a: Int, b: Int) -> Int in a + b} (1, 2)

print("myConstI = \(myConstI)")
print("myConstF(10, 20) = \(myConstF(10, 20))")

//===========================

struct Size {
    let width: Float
    let height: Float? = 0.0
}

let twoByTwo = Size(width: 2.0)
