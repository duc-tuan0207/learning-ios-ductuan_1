import UIKit

var greeting = "Hello, playground"
let scores = [8, 9, 10, 7, 6]
func average(of scores: [Int]) -> Double {
    var Tong : Double = 0
    
    for tong in scores {
        Tong += Double(tong)
    }
    
    let Average = Tong / Double(scores.count)
    return Average
}
func max(in scores: [Int]) -> Int {
    var Max = scores[0]
    
    for value in scores {
        if value > Max{
            Max = value
        }
    }
    return Max
}
func min(in scores: [Int]) -> Int {
    var Min = scores[0]
    
    for value in scores {
        if value < Min {
            Min = value
        }
    }
    return Min
}
func grade (for average: Double) -> String {
    if average > 8 {
            return "A"
        } else if average == 8 {
            return "B"
        } else if average < 4 {
            return "D"
        } else if average < 7 {
            return "C"
        } else {
            return "Không xác định"
        }
}
let avg = average(of: scores)
print("Average:", avg)
let maxScore = max(in: scores)
print("Max:", maxScore)
let minScore = min(in: scores)
print("Min:", minScore)
let gradeResult = grade(for: avg)
print("Grade:", gradeResult)







let comments = ["hello", "", "this is stupid", "nice"]
let banned = ["stupid", "hate"]


func filterEmpty(_ comments: [String]) -> [String] {
    var result : [String] = []
    
    for comment in comments {
        if comment.isEmpty {
            continue
        }
        result.append(comment)
    }
    return result
}

func containsBannedWord(_ comment: String, banned:[String]) -> Bool {
    for word in banned {
        if comment.contains(word) {
            return true
        }
    }
    return false
}

func moderate(_ comments: [String], banned: [String]) -> [String] {
    let nonComments = filterEmpty(comments)
    var result : [String] = []
    for commet in nonComments {
        if containsBannedWord(commet, banned: banned) {
            result.append("[REMOVED]")
        }
        result.append(commet)
    }
    return result
}
let out = moderate(comments, banned: banned)
print(out)




let prices: [Double] = [10.0, 25.5, 4.5]

func  totalPrice( of prices: [Double],
                  taxRate: Double = 0.1,
                  discount: Double = 0 ) -> Double {
    var sum : Double = 0
    for price in prices {
        sum += Double(price)
    }
    return (sum + (sum * taxRate)) - discount
}

let prin = totalPrice(of: prices)
print("total: \(prin)")






func log(_ messages: String...,prefix: String = "[APP]") {
    for message in messages {
        print("\(prefix) \(message)")
    }
}
log ("Start", "Loading", "Done")
log ("Timeout", prefix: "[ERROR]")
log()




enum RegisstrationError: Error {
    case isEmpty
    case tooShort
    case noNumber
    case noError
    case sucess
}
func register(username: String, password: String) throws -> Error {
    if username.isEmpty {
        throw RegisstrationError.isEmpty
    }
    if password.count < 6 {
        throw RegisstrationError.tooShort
    }
    if password.rangeOfCharacter(from: .decimalDigits) == nil {
        throw RegisstrationError.noNumber
    }
    throw RegisstrationError.noError
}

do {
    try register(username: "admin", password: "")
}catch RegisstrationError.isEmpty {
    print("Username không được rỗng")
}catch RegisstrationError.noNumber{
    print("Password phải có số")
}catch RegisstrationError.tooShort {
    print("Password phải hơn hoặc bằng 6 kí tự")
}catch {
    print("Lỗi Khác: \(error)")
}

var password = "123456"
var count = 0
var intputpassowrd = "123"
repeat {
    count += 1
    print("Bạn đã đăng nhập sai số lần \(count) ")
    
    if(intputpassowrd == password) {
        print("Đăng nhập thành công")
        break
    }
    
}
while count < 3

if(count >= 3) {
    print("Đăng nhập không thành công, khóa tài khoản")
}

