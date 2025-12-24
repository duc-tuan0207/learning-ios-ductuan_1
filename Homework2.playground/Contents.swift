//bai8
import UIKit
func validateSKU(_ sku: String?){
    guard let sku = sku else {
        print( "Chưa nhập mã sản phẩm")
        return
    }
    guard sku.isEmpty == false else {
        print("Mã sản phẩm rỗng")
        return
    }
    guard sku.hasPrefix("SKU-") else {
            print("Sai định dạng SKU")
            return
        }
        print("SKU hợp lệ: \(sku)")
    }
print(validateSKU("SKU-123"))
//bai9
import UIKit
func validatePrice(_ text: String?){
    guard let text = text,!text.isEmpty else {
        print("Chưa nhập giá")
        return
    }
    guard let price = Double(text) else {
        print("Giá không hợp lệ")
        return
    }	
    guard price >= 0 else {
        print("Giá phải lớn hơn 0")
        return
    }
    print("Giá hợp lệ: \(text)VND")
}
print(validatePrice("100.000"))
//bai10
