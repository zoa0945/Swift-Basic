import UIKit

//조건문 if 조건 { 참일때 코드 } else { 거짓일떄 코드 }
//조건이 참일 때 
let sumAll = 15

if(sumAll > 0) {
    print("양수")
}

let example = 4 > 5

if example {
    print("--> 참")
} else {
    print("--> 거짓")
}

let c = "Liu"
let d = "Ping"

if c == d {
    print("동명이인")
} else {
    print("이름이 다름")
}

let isPing = d == "Ping"
let isMale = true

let PingAndMale = isPing && isMale
let PingOrFemale = isPing || !isMale

let greetingMessage: String = isPing ? "Hello Ping" : "Hello Somebody"
print("Msg: \(greetingMessage)")

var hour = 50
let payPerHour = 10000
var salary = 0

if hour > 40 {
    let extraHours = hour - 40
    salary += extraHours * payPerHour * 2
    hour -= extraHours
}
salary += hour * payPerHour


//While Loop
//while : 조건 -> 코드수행 -> 조건 -> 코드수행 -> ...
//repeat : 코드수행 -> 조건 -> 코드수행 -> 조건 -> ...

var i = 0
while i < 10 {
    print(i)
    i += 1
}

var j = 10
while j < 10 {
    print(i)
    if j == 5 {
        break
    }
    j += 1
}

var k = 10
repeat {
    print(k)
    k += 1
} while k < 10

//for Loop
let closedRange = 0...10 // 0~10
let halfClosedRange = 0..<10 // 0~9 10을 포함하지 않음

var aa = 0
var sum = 0
for aa in closedRange {
    sum += aa
}
sum // 55

var bb = 0
var sum2 = 0
for bb in halfClosedRange {
    sum2 += bb
}
sum2 // 45

let name = "Liu"
for _ in closedRange {
    print("name: \(name)")
}

var f = 0
var g = 0
for f in closedRange {
    for g in closedRange {
        print("구구단 -> \(f) * \(g) = \(f * g)")
    }
}

//stride 함수와 함꼐 사용 가능
let myNumber = 10
for i in stride(from: 0, to: myNumber, by: 1) { // myNumber를 포함하지 않음
    print(i)
}

for i in stride(from: 0, through: myNumber, by: 1) { // myNumber를 포함
    print(i)
}

//switch Statement : 한가지 case를 수행하고 나면 switch문을 벗어난다
let num = 10

switch num {
case 0:
    print("0 입니다.")
case 1...9:
    print("1과 9사이 수 입니다.")
case 10:
    print("10 입니다.")
default:
    print("나머지 입니다.")
}

//case안에 콤마로 여러가지 조건을 혼합해서 사용할 수 있음
let pet = "cat"

switch pet {
case "dog", "cat", "bird":
    print("반려동물입니다.")

default:
    print("잘모르겠습니다.")
}

//case에 where 조건을 사용 할 수 있음
let num2 = 158
switch num2 {
case _ where num2 % 2 == 0:
    print("짝수")
default:
    print("홀수")
}

//값 바인딩 : 특정 값을 각각 다른 case에 정의하고 그 정의된 상수를 또다른 case에서 사용
let coor = (x: 10, y: 10)

switch coor {
case (0, 0):
    print("원점")
case (let x, 0):
    print("x축 위 --> x: \(x)")
case (0, let y):
    print("y축 위 --> y: \(y)")
case (let x, let y) where x == y:
    print("사분면 내 --> x와 y가 같음 x: \(x), y: \(y)")
case (let x, let y):
    print("사분면 내 --> x와 y가 다름 x: \(x), y: \(y)")
}

//제어전송구문 : continue, break, fallthrough
//continue : 현제 loop를 중지하고 다음 loop를 수행
//break : 전체 제어문의 실행을 즉각 중지 (loop나 switch문에서 사용 가능)
//fallthrough : switch문에서 하나의 case에 대해 실행 한 후 이후 case에 대해서도 실행하도록 함

//Label Statements : label이름과 while조건을 넣어 특정 구문을 실행
var square = 0
var finalSquare = 30

gameLoop : while square != finalSquare {
    let diceRoll = arc4random_uniform(6)
    if square > finalSquare {
        square -= 10
    }
    switch square + Int(diceRoll) {
    case finalSquare: break gameLoop
    default:
        square += Int(diceRoll)
    }
}

square
print("Nice!")

//이른 탈출 : guard문을 이용해 특정 조건을 만족하지 않으면 이후 코드를 실행하지 않음
let lotteryNum = arc4random_uniform(45)

func lotto(_ n: UInt32) {
    guard lotteryNum == 30 else {
        print("retry..")
        return
    }
    print("Lucky!")
}

lotto(lotteryNum)
