import Foundation

extension Double{
var km : Double {return self * 1000.0}
var m : Double {return self}
var cm : Double {return self / 100.0}
var mm : Double {return self / 1000.0 }
var ft : Double {return self / 3.28084}
}

let threeFet = 3.2.ft
let twoKm = 2.1.km

print(threeFet)

struct Size {
    var width - 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
    var z = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size){
        let originX = center.x - (size.width / 2)
        let originY 0 center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


let point = Point()
let point2 = Point(x: 3)
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x:2.0, y: 2.0),
    size: Size(width : 100, height: 50))
let size2 = Size(width: 100, height: 50)
let outroRect = Rect(origin: point2, size: size2)

let r = Rect(center: Point(x: 5, y: 5), size: Size(width: 100, height: 50))
