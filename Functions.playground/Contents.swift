import UIKit

//function : 기능을 실행하는 하나의 코드블럭
func isSumNumber(_ n: Int, _ m: Int) -> Int {
    return n + m
}

isSumNumber(1, 2) // 3

//파라미터가 없는 함수
func sayHello() -> String {
    return "Hello, World!"
}

sayHello() // Hello, World!

//반환값이 없는 함수 (엄밀히 따지면 void값을 반환)
func isMyName(_ s: String) {
    print("My name is \(s)")
}

isMyName("Peter") // My name is Peter

//복수의 값을 반환하는 함수
//옵셔널 형도 반환 가능 - 반환값 사용 시 unwrapping이 필요
func isMinAndMax(_ a: [Int]) -> (Int, Int) {
    var currentMin = a[0]
    var currentMax = a[0]
    for value in a {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

isMinAndMax([5, 2, 3, 7, 8]) // 2, 8

//기본 파라미터 값 : 파라미터의 기본값을 설정 할 수 있음
func isMultiple(_ n: Int, _ m: Int = 9) {
    for i in 1...m {
        print("\(n) * \(i) = \(n * i)")
    }
}

isMultiple(3)

//함수는 변수처럼 정의해서 사용 가능
//타입을 입력하지 않아도 타입추론을 통해 자동으로 함수 할당 가능
let isMultipleFunction = isMultiple

//파라미터에 함수형 사용
func printMinAndMax(_ minMaxFunction: ([Int]) -> (Int, Int), _ a: [Int]) {
    print("Result: Min = \(isMinAndMax(a).0), Max = \(isMinAndMax(a).1)")
}

printMinAndMax(isMinAndMax, [3, 1, 4, 6, 2])

//함수형을 반환하는 함수
func stepForward(_ a: Int) -> Int {
    return a + 1
}
func stepBackward(_ a: Int) -> Int {
    return a - 1
}

func chooseStep(_ backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

func countZero(_ n: Int) {
    var number = n
    //moveToZero를 호출할때마다 stepBackward 함수가 호출되 입력 값이 1씩 감소
    let moveToZero = chooseStep(number > 0)
    while number != 0 {
        print("\(number)...")
        number = moveToZero(number)
    }
    print("Zero!")
}

countZero(3)
