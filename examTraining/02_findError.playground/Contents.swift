class MyClass {
    var a  = 20
    
    init (aWert: int) {
        a = 10
    }
}

let myInstance = MyClass(aWert: 10)
let anotherMyInstance = MyClass()

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
//let anotherMyInstance = MyClass() // error: cannot invoke initializer for type 'MyClass' with no arguments
//
//let myStr = "Highlander"
//myStr += " and another Highlander" // error: left side of mutating operator isn't mutable: 'myStr' is a 'let' constant
//
//let i = 1
//
//if i { // error: 'Int' is not convertible to 'Bool'
//    print("Alles ok")
//}

