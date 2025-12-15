//
//  main.swift
//  bai1
//
//  Created by Dezhun on 13/12/25.
//

import Foundation

print("Hello, World!")

var diem = 36
var diemtoan = 36.36
diem = 300

let gpa = 40

print(diem, gpa, diemtoan)
var monhoc  = "ngu van" + "toan hoc"
var tongdiem = String(diem) + monhoc
print(tongdiem)
var name = "Tuấn"
let gth = "xin chào\(name)"+String(diemtoan)
print(gth)
var family = ["Tuấn", "Hào", "Hưng", "Hùng"]
family[1] = "Hòa"
family.append("Hải")
print(family)
var danhsach = ["1":"hao", "2":"tuan", "3":"hung"]
danhsach ["4"] = "hai"
print(danhsach)
print(danhsach["1"])
