import UIKit

//배열, 셋, 딕셔너리 세가지 타입
//배열(Array) : 순서가 있고 중복이 존재할 수 있음
var Array = [Int]() // 빈배열
var Array2: [Int] = [] // 빈배열
var Array3 = [Int](repeating: 0, count: 3) // [0, 0, 0]

//배열은 연산자를 통해 합칠 수 있음
var sumArray = Array + Array3 // [0, 0, 0]

//원소 개수 확인
sumArray.count // 3

//배열의 마지막 인덱스에 원소 추가
sumArray.append(3) // [0, 0, 0, 3]

//배열이 비어있는지 확인
sumArray.isEmpty // false

sumArray

//특정 위치에 원소 추가/삭제/접근
sumArray.insert(5, at: 0) // [5, 0, 0, 0, 3]

sumArray.remove(at: 2) // 0 제거

var isFirstItem = sumArray[0] // 5

//배열의 값과 인덱스가 필요한 경우 enumerated() 메소드를 사용
for (index, value) in sumArray.enumerated() {
    print("Item \(index + 1) : \(value)")
}

//Set : 순서가 없고 중복이 존재하지 않음
var mySet = Set<Int>()
var mySet2: Set<String> = []

mySet = [1, 5, 2, 3]

//배열과 마찬가지로 for-Loop를 이용하여 순회 가능
for value in mySet {
    print(value)
}

//Set 명령
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() // 합집합
oddDigits.intersection(evenDigits).sorted() // 교집합
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // 차집합
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // 합집합 - 교집합

//Set의 동등비교
let num1: Set = [1,2,3]
let num2: Set = [1,2,3,4,5,6,7,8,9]
let num3: Set = [10,20]

num1.isSubset(of: num2) // true : num1이 num2에 포함
num2.isSuperset(of: num1) // true : num2가 num1을 포함
num2.isDisjoint(with: num3) // true : 둘간의 공통값이 없음

//Dictionary : 순서가 없고 Key값은 중복이 없지만 Value는 중복이 있을 수 있음
var myDic: [Int:String] = [1:"First", 2:"Second", 3:"Third"] // [Key1:Value1, Key2:value2, Key3:value3]의 형대로 선언

//값 추가
myDic[4] = "Fourth"
myDic.updateValue("Fifth", forKey: 5)

print(myDic)

//For-Loop로 순회
for number in myDic {
    print("Key: \(number.0), Value: \(number.1)")
}
