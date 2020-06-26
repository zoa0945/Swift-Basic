import UIKit

//공통점
//값을 저장하기 위한 프로퍼티 정의
//기능을 제공하기 위한 메소드 정의
//subscirpt 정의
//initializer 정의
//기본 구현에서 기능 확장 (extension)
//표준기능을 제공하기 위한 프로토콜 순응

//차이점 : 클래스만 가능한 기능
//상속 : 클래스의 여러속성을 다른 클래스에 물려주는 기능
//타입 캐스팅 : 런타임에 클래스 인스턴스의 타입 확인
//소멸자 : 할당된 자원을 해제 시킴 (free up)
//참조 카운트 : 클래스 인스턴스에 하나이상의 참조 가능

//선언
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution() // Resolution structure를 값으로 사용
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

//프로퍼티 접근
someResolution.width // 0
someVideoMode.resolution.width // 0

someVideoMode.resolution.width = 1200

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)

vga.width // 640
vga.height // 480

//Class = Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

tenEighty.frameRate // 30.0

//Structure는 값을 다른 상수나 변수에 할당할때 복사
//Class는 값을 다른 상수나 변수에 할당할때 참조

//Structure를 사용하는 경우
//주 목적이 관계된 간단한 값을 캡슐화 하기 위한 것인 경우
//인스턴스가 참조되기보다 복사되기를 기대하는 경우
//저장된 어ㄸ떤 프로퍼티가 참조되기보다 복사되기를 기대하는 경우
//프로퍼티나 메소드를 상속할 필요가 없는 경우
