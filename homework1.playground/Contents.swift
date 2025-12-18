import UIKit

struct DongA{
    let mssv: Int
    var HoTen:String
    var Lop:String
    var Diem:Float
}
var ds: [DongA] = [
    DongA(mssv: 1, HoTen: "DucTuan", Lop: "TPM12", Diem: 5.00),
    DongA(mssv: 2, HoTen: "TuanCuong", Lop: "TPM11", Diem: 9.00),
    DongA(mssv: 3, HoTen: "MinhHai", Lop: "TPM1", Diem: 10),
    DongA(mssv: 4, HoTen: "LongTong", Lop: "TPM9", Diem: 8.00)
]
ds[2].Diem = 7.00
for In in ds where In.Diem >= 8.00{
    print(In.mssv,In.HoTen,In.Lop,In.Diem)
}
class DuyTan{
    let mssv: Int
    var HoTen: String
    var Lop: String
    var Hight: Float
    init(mssv: Int, HoTen: String, Lop: String, Hight: Float) {
        self.mssv = mssv
        self.HoTen = HoTen
        self.Lop = Lop
        self.Hight = Hight
    }
}
let ds2: [DuyTan] = [
    DuyTan(mssv: 1, HoTen: "DucTuan", Lop: "TPM12", Hight: 1.75),
    DuyTan(mssv: 2, HoTen: "TuanCuong", Lop: "TPM11", Hight: 1.80),
    DuyTan(mssv: 3, HoTen: "MinhHai", Lop: "TPM1", Hight: 1.85),
    DuyTan(mssv: 4, HoTen: "LongTong", Lop: "TPM9", Hight: 1.70)
]
ds2[2].Hight = 1.65
for In in ds2 where In.Hight >= 1.75 {
    print("\n", In.mssv,In.HoTen,In.Lop,In.Hight)
}
// struct an toàn tránh nhiều lỗi và không thể kế thừa được
// class có thể kế thừa và có thể bị lỗi nhiều hơn 
