//: create by Oleksandra Baga

import UIKit

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}

class Rectangle {
    var origin = Point()
    var size = Size()
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    var position : Point {
        set(newPosition) {
            origin = newPosition
        }
        
        get {
            return origin
        }
    
    }
}

class LinkedRectangles {
    var rect01: Rectangle
    var rect02: Rectangle
    
    init(rect01: Rectangle, rect02: Rectangle) {
        self.rect01 = rect01
        self.rect02 = rect02
    }
    
    var position : Point {
        set(newPosition) {
            let dx = rect02.origin.x - rect01.origin.x
            let dy = rect02.origin.y - rect01.origin.y
            let np = Point(x: newPosition.x + dx, y: newPosition.y + dy)
            
            rect01.position = newPosition
            rect02.position = np
        }
        get {
            return rect01.origin
        }
    }
}

var r01 = Rectangle(origin: Point(x: 3, y: 4), size: Size(width: 5, height: 6))
var r02 = Rectangle(origin: Point(x: 7, y: 10), size: Size(width: 3, height: 3))
var linkedRects = LinkedRectangles(rect01: r01,
                                   rect02: r02)

linkedRects.position = Point(x: 10, y: 10)
print("New origin of a first rect: \(r01.origin.x), \(r01.origin.y)")
print("New origin of a second rect: \(r02.origin.x), \(r02.origin.y)")
