import Foundation

func studyiOS() {
    print("주말에도 공부하기")
}

let study: () -> () =  {
    print("주말에도 공부하기")
}

study()

//클로저 헤더 in 클로저 바디
let studyHarder = { () -> () in
    print("주말에도 공부하기")
}

func getStudyWithMe(study: () -> ()) {
    print("주말에도 공부하기..")
    study()
}

//코드를 전혀 생략하지 않고, 클로저 구문을 사용한 상태. 함수의 매개변수 내에 클로저가 그대로 들어간 형태
getStudyWithMe(study: { () -> () in
    print("주말에도 공부하기")
})

getStudyWithMe() { () -> () in
    print("주말에도 공부하기")
}
//
//getStudyWithMe {
//    <#code#>
//}

//(Int) -> String
func example(number: Int) -> String {
    return "\(number)"
}

example(number: Int.random(in: 1...100))

func randomNumber(result: (Int) -> String){
    result(Int.random(in:  1...100))
}

randomNumber(result: { (number: Int) -> String in
    return "행운의 숫자는 \(number)입니다."
})


randomNumber(result: { (number: Int) in
    return "행운의 숫자는 \(number)입니다."
})

randomNumber(result: { (number) in
    return "행운의 숫자는 \(number)입니다."
})

//매개변수가 생략 되면, 할당되어 있는 내부상수 $0를 사용 할 수 있다.

randomNumber(result: {
    return "행운의 숫자는 \($0)입니다."
})

//Swift5.1 한 줄일 경우 return 생략 가능
randomNumber(result: {
    "행운의 숫자는 \($0)입니다."
})

//후행클로저 사용 가능
randomNumber() {
    "행운의 숫자는 \($0)입니다."
}

randomNumber {
    "행운의 숫자는 \($0)입니다."
}


let student = [2.2,4.5,3.2,4.9,3.3,2.2]

var newStudent: [Double] = []

for item in student{
    if item >= 4.0 {
        newStudent.append(item)
    }
    print(newStudent)
}

//value: element 하나하나의 값
let filterStudent = student.filter { value in
    value >= 4.0
    
}
let filterStudent2 = student.filter { $0 >= 4.0 }

print(filterStudent)
print(filterStudent2)


let number = [Int](1...100)

var newNumber: [Int] = []

for number in number {
    newNumber.append(number*3)
    
}

print(newNumber)


let mapNumber = number.map {$0 * 3}
let mapResult = number.map {"\($0)번 입니다"}

print(mapNumber)
print(mapResult)

let movieList = [
    "괴물" : "박찬욱",
    "기생충" : "봉준호",
    "옥자" : "봉준호",
    "인셉션" : "크리스토퍼 놀람",
    "인터스텔라" : "크리스토퍼 놀람"
]

//특정 감독의 영화만 출력
let movieResult = movieList.filter {$0.value == "봉준호"}
print(movieResult)
//영화 이름을 배열로 변환
let movieResult2 = movieList.filter {$0.value == "봉준호"}.map{$0.key}
print(movieResult2)

