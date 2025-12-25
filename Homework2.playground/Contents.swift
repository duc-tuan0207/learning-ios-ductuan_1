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
print(validateSKU("SKU-3636"))
//bai9
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
print(validatePrice("36.000"))
//bai10
func calcTotal(priceText: String?, quantityText: String?){
    guard let priceText, let quantityText else {
        return
    }
    guard let price = Double(priceText), let quantity = Int(quantityText) else {
        return
    }
    guard quantity >= 0 else {
        print("Số lượng không hợp lệ")
        return
    }
    let total = price * Double(quantity)
    print("Thành Tiền:\(total)")
}
print(calcTotal(priceText:"360000", quantityText:"36"))
//bai11
struct Product {
 let sku: String
 let name: String
 let price: Double
}
func createProduct(
 sku: String?,
 name: String?,
 priceText: String?
) -> Product? {
    guard let sku = sku, !sku.isEmpty else {
        print("SKU rỗng")
        return nil
    }
    guard let name=name,!name.isEmpty else {
        print("Chưa nhập tên")
        return nil
    }
    guard let priceText = priceText, !priceText.isEmpty else {
        print("Vui lòng nhập giá")
        return nil
    }
    guard sku.hasPrefix("SKU-") else {
        print("Sai định dạng")
        return nil
    }
    guard let price = Double(priceText) else {
        print("không hợp lệ")
        return nil
    }
    guard price > 0 else {
        print("Sai giá")
        return nil
    }
    return Product(sku: sku, name: name, price: Double(priceText)!)
}
print(createProduct(sku: "SKU-36", name: "Thanh Hóa", priceText: "36666666666")!)
