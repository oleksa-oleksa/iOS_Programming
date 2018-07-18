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
}

