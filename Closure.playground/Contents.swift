import UIKit

//Closure : 코드블럭, 이름이 없는 함수
/* { (parameters) -> return type in
     statements
   } 의 형태
*/
let numbers = [3, 5, 6, 1, 7, 2]

//정렬 메소드 (클로져 사용)
let reversedNumbers = numbers.sorted(by:
    /*{ (s1: Int, s2: Int) -> Bool in
        return s1 > s2
        }
        문맥에서 타입 추론 (타입 생략 가능)
      { s1, s2 in
        return s1 > s2
        }
        단일 표현 클로저에서의 암시적 반환 (반환 키워드 return 생략 가능)
      { s1, s2 in
        s1 > s2
        }
        인자 이름 축약 (인자 값을 순서대로 $0, $1, $2 등으로 표현 가능)
      { $0 > $1 }
        연산자 메소드 (Int, String 등의 타입은 비교연산자 > 구현). */
      >
 )

reversedNumbers // [7, 6, 5, 3, 2, 1]

//후위 클로져 (함수이ㅡ 마지막 인자로 클로저를 넣고 그 클로저가 길다면 후위 클로저 사용 가능)
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
