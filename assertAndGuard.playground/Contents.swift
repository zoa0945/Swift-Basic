import UIKit

/*
assert: 특정 조건을 체크하고 조건이 성립되지 않으면 메세지를 출력하게 할 수 있는 함수
guard: 조건을 검사하여 그 다음에 오는 코드를 실행할지 말지 결정하는 함수
       조건이 거짓일 때 구문이 실행
       주로 early exit이라고 해서 guard문이 거짓일 때 이후 코드가 작동하지 않도록
       방어코드를 작성할 때 사용
 */

var value = 0
//assert(value == 0)

value = 2
//assert(value == 0, "값이 0이 아닙니다")

//매개변수가 nil이 아닐 경우 출력, nil인 경우 return
func guardTest(_ value: Int?) {
    guard let value = value else { return }
    print(value)
}

guardTest(2)
guardTest(nil)
