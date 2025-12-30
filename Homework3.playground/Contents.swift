import UIKit

struct Student {
 let id: Int
 let name: String
 let score: Int
}
let students: [Student] = [
 Student(id: 1, name: "An", score: 8),
 Student(id: 2, name: "Binh", score: 4),
 Student(id: 3, name: "Chi", score: 7),
 Student(id: 4, name: "An", score: 6)
]
print(students)
print(students.map{students in students.name})
print(students.contains{students in students.score < 5})
print(students.allSatisfy{students in students.score >= 5})
print(students.first{students in
    students.id==2})

var set : Set<String> = ["An", "Binh","Chi","An"]
print(set)
var so : Set<Int> = [ 1, 2, 3]
so.insert(4)
so.remove(2)
print(so)

let a: Set<Int> = [1, 2, 3, 4]
let b: Set<Int> = [3, 4, 5]
let union = a.union(b)
print(union)
let inter = a.intersection(b)
print(inter)
let subtrac = a.subtracting(b)
print(subtrac)

let Dictionary:[Int : Student] = [
    1: Student(id:1, name:"An", score:8),
    2: Student(id:2, name:"Binh", score:4),
    3: Student(id:3, name:"Chi", score:7),
    4: Student(id:4, name:"An", score:6)
]
func traCuuSinhVien() {
    guard let traCuu = Dictionary[3], traCuu.id == 3 else {
        print("rỗng")
        return
    }

    print(traCuu)
}
print(Dictionary)
let allKey = Array(Dictionary.keys)
print(allKey)
let value = Array(Dictionary.values)
print(value)
