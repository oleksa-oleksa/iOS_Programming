//: Playground - noun: a place where people can play

import UIKit

protocol Log : AnyObject {
    func logMe(message: String)
}

struct Logger {
    weak var delegate: Log?
    
    func log(message: String) {
        delegate?.logMe(message: message)
    }
}

class Delegate1 : Log {
    func logMe(message: String) {
        if (message.range(of:"1") == nil) {
            print(message)
        }
    }
}

class Delegate2 : Log {
    func logMe(message: String) {
        if (message.range(of:"2") == nil) {
            print(message)
        }
    }
}


class Delegate3 : Log {
    func logMe(message: String) {
        if (message.range(of:"3") == nil) {
            print(message)
        }
    }
}

var d1 = Delegate1()
var d2 = Delegate2()
var d3 = Delegate3()

for idx in 1...3 {
    print("Iteration \(idx)")
    var l = Logger(delegate: d1)
    l.log(message: "Logger number one, loop \(idx)")
    
    l = Logger(delegate: d2)
    l.log(message: "Logger number two, loop \(idx)")

    l = Logger(delegate: d3)
    l.log(message: "Logger number three, loop \(idx)")
}
