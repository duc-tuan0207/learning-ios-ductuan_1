for i in 1...10{
    print("\n\(i)")
}
    let numbers : [Int] = [1,2,3,4,5]
    var Total : Int = 0
    for i in numbers {
        Total += i
    }
    print(Total)
    for i in 1...10{
        if i % 2 == 0{
            continue
        }else{
            print("\(i)")
        }
    }
func greet(name: String) -> String {
    return "Xin chào \(name)"
}

print(greet(name: "Phạm"), greet(name: "Nguyễn"))

func square(_ number : Int) -> Int{
    var s : Int = 0
    s = number * number
    return s
}

print(square(4), square(7))
func Greet(name : String = "Guest") ->String{
    return "Hello \(name)"
}
print(Greet(),Greet(name: "An"))

func Variadic(_ Numbers : Int...) {
    for i in Numbers {
        print("\n \(i)")
    }
}
Variadic(1,2,3,4)


enum Numbers : Error {
    case ValidNumber
    case InvalidNumber
}
func Throwing (_ i : Int) throws {
    if i < 0 {
        throw Numbers.InvalidNumber
    }else{
        throw Numbers.ValidNumber
    }
}

do{
    try Throwing(-8)
    print("Hợp lệ")
} catch Numbers.InvalidNumber {
    print("Nhập số lớn hơn hoặc bằng 0")
} catch Numbers.ValidNumber {
    print("Đúng rồi")
} catch {
    print("Lỗi khác:.....")
}

func ve0(_ number : inout Int ){
    number = 0
}
var x = 10
ve0(&x)
print(x)
