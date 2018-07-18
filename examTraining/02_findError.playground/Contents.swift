class MyClass {
    var a  = 20

    init (aWert: Int) {
        a = 10
    }
}

let myInstance = MyClass(aWert: 10)
let anotherMyInstance = MyClass(aWert: 20)

var myStr = "Highlander"
myStr += " and another Highlander"

var i : Int?

if i != nil {
    print("Alles ok")
}


//class MyClass {
//    var a  = 20
//
//    init (aWert: int) {
//        a = 10
//    }
//}
//
//let myInstance = MyClass(aWert: 10)
//let anotherMyInstance = MyClass() // error: missing argument for parameter 'aWert' in call
//
//
//let myStr = "Highlander"
//myStr += " and another Highlander" // error: left side of mutating operator isn't mutable: 'myStr' is a 'let' constant
//
//let i = 1 // note: change 'let' to 'var' to make it mutable
//
//if i { // error: 'Int' is not convertible to 'Bool'
//    print("Alles ok")
//}

