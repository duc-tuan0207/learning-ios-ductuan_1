import Foundation

var array:[Int] = [1,3,2,7,6]
if !array.isEmpty {
    print("array is empty")
}
print(array[0],array[2...])
array.append(4)
array.remove(at: 3)
array[1]=10
print(array)
var set : Set<String> = ["abc","abd","acb"]
if set.isEmpty{
    print("")
}
set.insert("Hoang")
var DIC:[String:Any] = ["a13":"ab","a12":"bc","a11":"cd"]
