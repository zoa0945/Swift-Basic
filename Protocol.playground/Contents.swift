import UIKit

//Protocol: 특정 여고할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진

//정의
/*
protocol 이름 {
 ...
}
*/

protocol SomeProtocol {
    
}

protocol SomeProtocol2 {
    
}

//Protocol 채택 방법, 여러개의 protocol을 채택 가능
struct SomeStructure: SomeProtocol, SomeProtocol2 {
    
}

/*
프로퍼티 요구사항
 - 프로토콜은 자신을 채택한 타입이 어떤 프로퍼티를 구현해야 하는지 요구
 - 저장 프로퍼티인지 계산 프로퍼티인지 지정하지 않고 프로퍼티 이름과 타입만 지정
 - read only인지 read, write인지 설정 해주어야 함
 - type property를 요구하려면 앞에 static키워드를 적어줘야 함
 - 프로토콜은 자신을 채택한 타입의 메서드를 요구할 수 있음
 - 프로토콜은 자신을 채택한 타입의 생성자도 요구할 수 있음
*/

protocol FirstProtocol {
    var name: Int { get set } //read, write
    var age: Int { get } //read only
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNames {
    var fullName: String { get set }
    func printFullName()
}

struct Person: FullyNames {
    //FullyNames protocol 정의 사항
    var fullName: String
    
    func printFullName() {
        print(fullName)
    }
}

protocol SomeProtocol3 {
    func someTypeMethod()
}

protocol SomeProtocol4 {
    init(someParameter: Int)
}

protocol SomeProtocol5 {
    init()
}

class SomeClass: SomeProtocol5 {
    //class에서는 생성자 요구사항을 준수하려면 required 식별자가 필요함
    required init() {
        
    }
}
