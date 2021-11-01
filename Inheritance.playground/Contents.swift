import UIKit

//Base Class
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise () {
        print("speaker on")
    }
}

//SubClass
/*
class 클래스 이름: 부모클래스 이름 {
  //하위 클래스 정의
*/

class Bicycle: Vehicle {
    var hasBasket = false
}

var bicycle = Bicycle()
bicycle.currentSpeed
bicycle.currentSpeed = 15.0
bicycle.currentSpeed

/*
override : 서브 클래스는 슈퍼 클래스에서 정의된 메소드, 프로퍼티 등을 그대로 사용하지 않고
자신만의 기능으로 변경하여 사용 가능
*/

//서브클래스에서 슈퍼클래스의 특성을 재정의 할 때 슈퍼클래스의 특성을 서브클래스에서 사용하고 싶을때
//super 키워드 사용

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

//property overriding
//슈퍼클래스의 프로퍼티도 서브클래스에서 재정의 가능
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 2
print(car.description)

/*
 Computed Property, Stored Property를 override 한 property는
 getter, setter를 가질 수 있고 sub class에서 재정의 하려는 property는
 super class의 이름과 타입이 일치해야 함
 super class에서 read, write로 정의된 property는 read only로 override 할 수 없지만
 super class에서 read only로 정의된 property는 read, write로 override 할 수 있음
 상속된 property의 override를 사용하여 property observer를 추가 할 수 있음
 상수 저장 property나 read only property에는 property observer를 추가 할 수 없음
 값을 설정 할 수 없기 때문에
 final키워드가 붙은 property는 override할 수 없음 (method, property, type property가 override되는 것을 방지)
 class를 정의 할 때도 적용
 */

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
