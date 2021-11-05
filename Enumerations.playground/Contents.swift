import UIKit

//열거형 (Enumerations) : 관련된 값으로 이루어진 그룹을 공통의 타입으로 선언
//case 값을 사용

/*
enum SomeEnum{
   ...
}
 */

enum CompassPoint {
    // case north, south, west, east
    case north
    case south
    case west
    case east
}

//초기화 될때 타입추론 가능
var directionToHead = CompassPoint.west // west
directionToHead = .east // east

//관계 값 : 각 case에 custom type의 추가적인 정보를 저장할 수 있음
enum barcode {
    case upc(Int, Int, Int, Int) // 바코드는 Int 4구역으로 이루어져 있다
    case qrCode(String) // qr코드는 String으로 이루어져 있다
}

enum PhoneError {
    case unknown
    case batteryLow(String)
}

let error = PhoneError.batteryLow("배터리가 부족합니다.")

switch error {
case .batteryLow(let message):
    print(message)
case .unknown:
    print("알 수 없는 오류입니다.")
}

//Raw값 : case에 지정된 고유의 값
//rawValue를 사용하여 그 값을 사용할 수 있음
//raw값은 Character, String, Int, Float 등의 형을 사용할 수 있음
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//암시적으로 할당 : case 별로 모두 할당하지 않아도 자동으로 값을 할당해줌
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupitersaturn, uranus, neptune
}

let earthsOrder = Planet.earth.rawValue // 3
let uranusOrder = Planet.uranus.rawValue // 6

//열거형에 지정된 raw값이 아닌 값으로 지정하면 그 값은 nil이 됨
let Find = 11
if let somePlanet = Planet(rawValue: Find) {
    switch somePlanet {
    case .earth:
        print("Our Planet")
    default:
        print("Not safe")
    }
} else {
    print("Can't Find Planet")
}

//재귀 열거자 : 다른 열거를 관계값으로 갖는 열거형 (indirect 키워드 사용)
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

evaluate(product)
