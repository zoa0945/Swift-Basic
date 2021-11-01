import UIKit

//공통점
//값을 저장하기 위한 프로퍼티 정의
//기능을 제공하기 위한 메소드 정의
//subscirpt 정의
//생성자(initializer)를 사용해 초기값을 설정 가능
//내부 값에 .을 사용하여 접근 가능
//기본 구현에서 기능 확장 (extension)
//표준기능을 제공하기 위한 프로토콜 순응

//Class
//참조 타입이기 때문에 메모리 스택영역에는 인스턴스의 메모리 주소(포인터)만 할당
//실제 데이터는 힙(heap)영역에 할당
//ARC로 메모리 관리
//상속 : 클래스의 여러속성을 다른 클래스에 물려주는 기능
//타입 캐스팅 : 런타임에서 클래스 인스턴스의 타입 확인
//소멸자(deinit) : 할당된 자원을 해제 시킴 (free up)
//참조 카운트 : 클래스 인스턴스를 하나이상 참조 가능
//여러 변수에 할당한 뒤 값을 변경시키면 모든 변수에 영향을 줌 (메모리가 복사 됨)

//Structure
//값 타입이기 때문에 변수를 설정하면 스택영역에 값이 저장
//ARC로 메모리 관리 불가
//구조체 변수를 새로운 변수에 할당할 때마다 새로운 구조체가 생성
//즉 같은 구조체를 여러 변수에 할당한 뒤 값을 변경시켜도 다른 변수에 영향을 주지 않음 (값 자체를 복사)

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
