import UIKit

var greeting = "Hello, playground"
var n : Int = 3
var ketQua = (n % 3 == 0) ? "đúng": "sai"
let array: [Int] = [1,3,4,5,7857,3]
//print(ketQua)
for index in array where index % 2 == 0 {
    //print(index)
}
var nhom :[String] = ["Tuấn","Hùng","Cường","Hải"]
for inde in nhom{
    //print(inde)
}
//print(nhom)
struct User{
    let id: Int
    let name: String
    var age: Int
    
}
class Users{
    let id:Int
    let name: String
    var age: Int
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}
var users : [User] = [User(id: 1, name: "Tuấn", age: 20),
                      User(id: 2, name: "Cường", age: 20),
                      User(id: 3, name: "Hải", age: 20),
                      User(id: 4, name: "Thắng", age: 21)
                    ]
users[3].age = 8
let user2 : [Users] = [Users(id: 1, name: "Tuấn", age: 20),
                       Users(id: 2, name: "Hải", age: 20),
                       Users(id: 3, name: "Cường", age: 20)
                    ]
user2[2].age = 4
for danhSach in users where danhSach.age > 18{
    print(danhSach.name)
}
for danhsach2 in user2 where danhsach2.age > 18{
    print(danhsach2.name)
}
