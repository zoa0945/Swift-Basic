import UIKit

/*
 고차함수
 - 다른 함수를 전달 인자로 받거나 함수 실행의 결과를 함수로 반환하는 함수
 - map, filter, reduce
 */

// map
let numbers = [0, 1, 2, 3]
let mapArray = numbers.map{ $0 * 2 }
print(mapArray)

// filter
let intArray = [10, 5, 20, 13, 4]
let filterArray = intArray.filter{ $0 > 5 }
print(filterArray)

// reduce
let someArray = [1, 2, 3, 4, 5]
let reduceResult = someArray.reduce(0) {
    (result: Int, element: Int) -> Int in
    return result + element
}
