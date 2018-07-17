// Würde es ohne Initialisierung gehen?
var meinAlter: Int = 47
var grafikCode: UInt32 = 0

// ja. Mit "?" wird als nil initialisiert
var meinAlter2: Int?
var grafikCode2: UInt32?

let twoThousand: UInt16 = 2_000 // allowed
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one) // converted
// let twoThousandAndOneAgain = UInt8(twoThousand) + one // Error: Not enough bits to represent a signed value

//let canNotBeNehatibe: UInt8 = -1 // error: negative integer '-1' overflows when stored into unsigned type 'UInt8'
//let tooBig: UInt8 = UInt8.max + 1 //error: arithmetic operation '255 + 1' (on type 'UInt8') results in an overflow

// Sind die beiden Strings gleich?
var emptyString = ""
var anotherEmptyString = String()

var shoppingList = ["Eggs", "Milk"]
shoppingList.insert("Katze Milch", at: 0)
shoppingList.insert("Wine", at: 2) // "Wine" placed at 2, "Milk" moves at 3

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

var airports: [String: String] = ["BER": "Berlin", "DUB": "Dublin"]

// Notice that the current value is assigned to an optional as this value could be nil if the key was not present in the dictionary.
if let oldValue = airports.updateValue("Dublin Internationl", forKey: "DUB") {
    print("The old valus is: \(oldValue)") // prints "Dublin"
}

if let oldValue = airports.updateValue("berlin", forKey: "ber") {
    print("The old valus is: \(oldValue)") // nothing, no key "ber", case sensitive
}

var personalienJulia = ("Julia", 16, "Molkestr.", 45)
print("personalienJulia.0 = \(personalienJulia.0)") // Julia

var personalienTair = ("Tair", 17, "Marschenstr", 120)

var personen = [personalienJulia, personalienTair]
print("personen[0].0 = \(personen[0].0)") // Julia
print("personen[0] = \(personen[0])") // ("Julia", 16, "Molkestr.", 45)

personalienTair.2 = "Kürfursterdamm"
personalienTair.3 = 10
print("personen[1] = \(personen[1])") //("Tair", 17, "Marschenstr", 120)
                                      // we did not changed instances in array, only originals that were copied into array

//Erfasste Personen
//Julia
//Tair
print("Erfasste Personen")
for (name,_,_,_) in personen {
    print("\(name)")
}

var (_,_,_, hausNummer) = personalienTair
print("Die Hausnummer von Tair = \(hausNummer)") // 10, because we set before personalienTair.3 = 10


