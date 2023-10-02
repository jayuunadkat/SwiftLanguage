import UIKit

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    ///`ToggleComments and you will see the accessor error due private set property`
//    private(set) var center: Point {
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set (newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.width / 2)
        }
    }

}

var square = Rect(origin: Point(x:0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

// read only computed property
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {

        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
print("Getter Property >>> \(fourByFiveByTwo.volume)")
