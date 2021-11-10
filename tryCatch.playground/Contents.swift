import UIKit

// 에러 처리 : 프로그램 내에서 에러가 발생한 상황에 대해 대응하고 이를 복구하는 과정

/*
 Error 프로토콜은 요구사항이 없는 빈 프로토콜이지만
 오류사항을 표현하기위해 채택
*/
enum PhoneError: Error {
    case unknown
    case batteryLow(batteryLevel: Int)
}

/*
 throw
 - 오류를 발생시킬 수 있음
 - 에러가 발생할 것 같은 지점에 에러를 던져줄 수 있음
 */
// throw PhoneError.batteryLow(batteryLevel: 20)

/*
 Swift에서 오류를 처리하는 4가지 방법
 - 함수에서 발생한 오류를 해당 함수를 호출한 코드에 전파
 - do-catch 구문을 사용해 오류를 처리
 - 옵셔널 값으로 오류를 처리
 - 오류가 발생하지 않을 것이라고 확신
 */

// 쓰로잉 함수: 함수 내부에서 던져진 오류를 함수가 호출된 곳으로 전파
func checkPhoneBatteryStatus(_ batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneError.unknown }
    guard batteryLevel > 20 else { throw
        PhoneError.batteryLow(batteryLevel: 20) }
    return "batteryStatus is normal"
}

/* do-catch 구문
 do {
  try 오류 발생 가능 코드
 } catch 오류 패턴 {
  처리 코드
 }
*/

do {
    try checkPhoneBatteryStatus(20)
} catch PhoneError.unknown {
    print("Unknown Error")
} catch PhoneError.batteryLow(let batteryLevel) {
    print("BatteryLow: \(batteryLevel)%")
} catch {
    print("newError Occur: \(error)")
}

// try?를 사용하면 오류를 옵셔널 값으로 변환하여 처리
// 동작하던 코드가 오류를 던지면 코드의 반환값은 nil이 됨
let status = try? checkPhoneBatteryStatus(30)
print(status)
let status2 = try? checkPhoneBatteryStatus(-1)
print(status2)

// try!를 사용하면 에러가 발생할 때 런타임 에러가 발생해 프로그램이 강제 종료될 수 있음
// 오류가 발생하지 않을 것이라고 확신할 때 사용
let status3 = try! checkPhoneBatteryStatus(30)
print(status)

