import UIKit

/*
 Optional Chaining
 옵셔널에 속해 있는 프로퍼티, 메서드, 서브스크립션 등을
 가져오거나 호출할 때 사용할 수 있는 일련의 과정
*/

struct Developer {
    let name: String
}

struct Company {
    let name: String
    var developer: Developer?
}

var developoer = Developer(name: "hoon")
var company = Company(name: "NH", developer: developoer)
print(company.developer)
// print(company.developer.name) <- error
print(company.developer?.name)
print(company.developer!.name)
