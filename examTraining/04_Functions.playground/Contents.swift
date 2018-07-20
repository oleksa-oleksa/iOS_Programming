func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

// with parameters "Bob" and " "Thuesday"
print(greet(name: "Bob", day: "Thuesday"))

//==================================================

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}

print(sayHello(to: "Bill", and: "Ted"))

//==================================================

func someFunction(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no arguments are passed to the function call,
    // value of the parameterWithdefault is 12
    print(parameterWithDefault)
}

someFunction(parameterWithDefault: 6)
someFunction()

//=================================================

func swapTwoInts(a: inout Int, b: inout Int) {
    let tmpA = a
    a = b
    b = tmpA
}

var someInt = 3
var anotherInt = 25

print("Before swap: \(someInt), \(anotherInt)")
swapTwoInts(a: &someInt, b: &anotherInt)
print("After swap: \(someInt), \(anotherInt)")

//==================================================

func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String{
 
    return s1 + joiner + s2
}

func join2(s1: String, s2: String, joiner: String) -> String{
    
    return s1 + joiner + s2
}

print(join(string: "Hallo", toString: "Ihr Kinder", withJoiner: ", "))
print(join2(s1: "Hallo", s2: "Ihr Kinder", joiner: ", "))


