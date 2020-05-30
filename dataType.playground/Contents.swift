import UIKit

//숫자를 나타내는 데이터타입
let num: Int = 7 // 64비트 정수
let moreThanZero: UInt = 7 // 64비트 양의 정수
let num2: Double = 7.0 // 64비트 실수형
let num3: Float = 7.0 // 32비트 실수형

//문자를 나타내는 데이터타입
let text: String = "Hello" // 문자열 (2개이상의 문자)
let t: Character = "?" // 문자
let longText: String = """
Many Line String
""" // 여러중의 문자열은 큰따옴표 3개로 표현

//Any : 모든 타입을 지칭하는 키워드
//다른 데이터타입을 할당할 때는 형 변환을 해줘야 함
let everything: Any = 7.00
//everything = num2 -> num2는 Double형이므로 컴파일 오류

//nil : 없음을 뜻하는 키워드
//다른 언어의 null과 같은 의미
//다른 타입에 임의로 nil값을 할당 할때는 옵셔널을 사용해야함
//num = nil -> num은 Int형이므로 컴파일 오류

//Tuple : 좌표와 같이 쌍을 이루는 데이터 타입
let coor = (4, 6, 9)

let coorX = coor.0
let coorY = coor.1
let coorZ = coor.2

let coorNamed = (x: 2, y: 3)

let coorx2 = coorNamed.x
let coory2 = coorNamed.y

let (x3, y3) = coorNamed

x3
y3

//Boolean : true 또는 false로 나타나는 데이터 타입
let booleas: Bool = true

let ImGenius = true
let ImDude = false

