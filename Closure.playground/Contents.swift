import UIKit

/*
 Closure
 - 코드블럭, 이름이 없는 함수
 - 코드에서 전달 및 사용할 수 있는 독립 기능 블록
 - 일급 객체의 역할을 할 수 있음
 - 일급 객체: 전달 인자로 보낼 수도 있고 변수/상수 등으로 저장하거나 전달할 수 있으며
   함수의 반환 값이 될 수도 있음
 { (parameters) -> return type in
     statements
 }
*/
let hello = { () -> () in
    print("hello")
}

hello()

let hello2 = { (name: String) -> String in
    return "Hello \(name)"
}

// 클로저를 호출할 때 전달인자는 쓰지않고 parameter만 사용
hello2("Hoon")

// 클로저를 파라미터로 받는 함수
func doSomething(_ closure: () -> ()) {
    closure()
}

doSomething {
    print("hello")
}

// 후행클로저 : 마지막 매개변수로 전달되는 클로저에만 해당
// 매개변수로 클로저 여러개가 전달될 경우 마지막 클로저만 후행클로저로 사용 가능
doSomething() {
    print("hello2")
}

// 클로저를 반환하는 함수
func doSomething2() -> () -> () {
    return { () -> () in
        print("hello doSomething")
    }
}

doSomething2()()

// 매개변수에 클로저가 여러개 있는 경우 다중후행클로저 사용 가능
func doSomething3(success: () -> (), fail: () -> ()) {
    
}

doSomething3 {
    <#code#>
} fail: {
    <#code#>
}

let numbers = [3, 5, 6, 1, 7, 2]

//정렬 메소드 (클로져 사용)
let reversedNumbers = numbers.sorted(by:
    /*{ (s1: Int, s2: Int) -> Bool in
        return s1 > s2
        }
        문맥에서 타입 추론 (파라미너, 리턴타입 생략 가능)
      { s1, s2 in
        return s1 > s2
        }
        단일 표현 클로저에서의 암시적 반환 (반환 키워드 return 생략 가능)
      { s1, s2 in
        s1 > s2
        }
        약식인수를 사용하며 매개변수 이름 변환 (순서대로 $0, $1, $2 등으로 표현 가능)
      { $0 > $1 }
        연산자 메소드 (Int, String 등의 타입은 비교연산자 > 구현). */
      >
 )

reversedNumbers // [7, 6, 5, 3, 2, 1]

//후행 클로져 (함수의 마지막 인자로 클로저를 넣고 그 클로저가 길다면 후행 클로저 사용 가능)
let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five",
                  6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let num = [16, 57, 194]

let strings = num.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

strings // ["OneSix", "FiveSeven", "OneNineFour"]

//값 캡쳐 : 클로저는 특정 문맥의 상수나 변수의 값을 캡쳐하여 사용가능
//Int값을 받아 () -> Int 클로져를 반환하는 함수
//increase 함수는 total과 amount를 정의하지 않았지만 상위 함수의 값을 캡쳐링하여 사용
func incrementer(_ amount: Int) -> () -> Int {
    var total = 0
    func increase() -> Int {
        total += amount
        return total
    }
    return increase
}

//escaping Closure : 함수가 종료되고 난 후 실행되는 클로저 (파라미터 타입 앞에 @escaping 키워드를 명시)
var completionHandlers: [() -> Void] = []

//함수 밖에서 끝나는 클로저
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//함수 안에서 끝나는 클로저
func someFunctionWitnNoneEscapingClosure(closure: () -> Void) {
    closure()
}

class someClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            //escaping closure는 self를 명시적으로 언급해야함
            self.x = 100
        }
        someFunctionWitnNoneEscapingClosure {
            x = 200
        }
    }
}

let instance = someClass()
instance.doSomething()
print(instance.x) // 200

completionHandlers.first!()
print(instance.x) // 100

//Autoclosure : 자동클로저 (인자값이 없으며 특정 표현을 감싸서 다른 함수에 전달인자로 사용)
//클로저를 호출하기 전까지는 실행되지 않음
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
customersInLine.count // 5

let customerProvider = { customersInLine.remove(at: 0) }
//클로저를 지났음에도 변화가 없음
customersInLine.count // 5

//실제로 실행을 해야 변화가 생김
customerProvider() // Chris
customersInLine.count // 4

func serve(_ customerProvider: () -> String) {
    print("Now serving \(customerProvider())")
}

serve({customersInLine.remove(at: 0)}) // "Now serving Alex"

//@autoclosure 키워드를 사용하면 {} 생략 가능
func serving(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())")
}

serving(customersInLine.remove(at: 0)) // "Now serving Ewa"
