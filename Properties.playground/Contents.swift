import UIKit

//프로퍼티는 Class Structure Enumeration과 관련된 값
//Stored Property와 Computed Property가 있음

//Stored Property : 단순히 값을 포함하고 있는 프로퍼티
//Lazy Stored Property : 값이 사용되기 전까지는 계산되지 않는 프로퍼티
struct FixedLengthRate {
    //Stored Property
    var firstValue: Int
    var length: Int
    
    //Lazy Stored Property
    //처음 사용되기 전에는 값을 갖지 않고 이후에 값이 변경되기 때문에 무조건 변수로 선언
    lazy var Price: Int = 0
}

//Computed Property : 계산된 프로퍼티로 실제 값을 가지고 있는 것이 아니라 getter와 setter를 제공해 값을 탐색, 설정
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set (newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
initialSquareCenter.x // 5
initialSquareCenter.y // 5
square.center = Point(x: 15.0, y: 15.0)
square.origin.x // 10
square.origin.y // 10

//Read Only Computed Property : getter만 있고 setter를 제공하지 않는 프로퍼티
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByfiveBytwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
fourByfiveBytwo.volume // 40

//Property Observer : 새 값이 설정 될때마다 이벤트를 감지
//willset : 값이 저장되기 바로 직전에 호출
//didset : 값이 저장되고 난 직후에 호출
class SetCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print(newTotalSteps)
        }
        didSet {
            if totalSteps > oldValue {
                print("Add \(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = SetCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 895

//Type Property : static 또는 class 키워드 사용
//static으로 선언된 프로퍼티는 서브클래서에서 override 불가능
struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLavel = 0
    var currentLevel = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLavel {
                AudioChannel.maxInputLavel = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
AudioChannel.maxInputLavel // 7

rightChannel.currentLevel = 11
AudioChannel.maxInputLavel // 10
