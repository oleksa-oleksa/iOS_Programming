import UIKit

struct Resolution {
    var width = 0
    var height = 0
}


class myVideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let tenEighty = myVideoMode()
let hd = Resolution(width: 1920, height: 1080)

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "NewName"

tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("tenEighty.frameRate = \(tenEighty.frameRate), alsoTenEighty.frameRate = \(alsoTenEighty.frameRate)")

var cinema = hd
cinema.width = 2048

print("cinema is \(cinema.width) pixels wide")
print("hd is \(hd.width) pixels wide")

//===================================================
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}


let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
