import Foundation

struct User {
    let id: Int
    let name: String
    let isActive: Bool
}
struct Product {
    let id: Int
    let name: String
    let price: Double
}
struct Order {
    let orderId: Int
    let userId: Int
    let products: [Product]
}

enum UserStatus {
    case userNotFound
    case userInactive
    case userActive

    var message: String {
        switch self {
        case .userNotFound:
            return "không thấy người dùng"
        case .userInactive:
            return "người dùng không hoạt động"
        case .userActive:
            return "Người dùng hoạt động"
        }
    }
}

enum OrderStatus {
    case orderEmpty
    case orderValid

    var message: String {
        switch self {
        case .orderEmpty:
            return "đơn hàng trống"
        case .orderValid:
            return "đơn hàng hợp lệ"
        }
    }
}

enum TotalPriceStatus {
    case priceInvalid
    case priceOK

    var message: String {
        switch self {
        case .priceInvalid:
            return "giá không hợp lệ"
        case .priceOK:
            return "giá hợp lệ"
        }
    }
}

enum PaymentStatus {
    case paymentSuccess
    case paymentFailed
    case paymentInvalid

    var message: String {
        switch self {
        case .paymentSuccess:
            return "thanh toán thành công"
        case .paymentFailed:
            return "thanh toán thất bại"
        case .paymentInvalid:
            return "thanh toán không hợp lệ"
        }
    }
}

enum SearchOrderStatus {
    case emptyKeyword
    case found
    case notFound

    var message: String {
        switch self {
        case .emptyKeyword:
            return "từ khóa trống"
        case .found:
            return "đã tìm thấy"
        case .notFound:
            return "không tìm thấy"
        }
    }
}

func checkUserStatus(users: [User], userId: Int) -> UserStatus {
    let foundUser = users.first{user in
        user.id == userId
    }
    if foundUser == nil {
        return .userNotFound
    }
    let user = foundUser!
    if user.isActive == false {
        return .userInactive
    }
    return .userActive
}

func validateOrder(order: Order?) -> OrderStatus {
    let product = order.map {Order in
            Order.products.isEmpty == false
        }
    if product == true {
        return .orderValid
    }else{
        return .orderEmpty
    }
}
func calculateTotalPrice(products:[Product],onResult:(TotalPriceStatus,Double?)->Void){
    if products.contains(where: {product in product.price < 0}) {
        onResult(.priceInvalid, nil)
        return
    }
    let gia = products.map { product in product.price }
    let tong = gia.reduce(0) { sum, gia in
        sum + gia
    }
    onResult(.priceOK,tong)
}

func payment(totalPrice: Double?) -> PaymentStatus {
    switch totalPrice {
    case nil :
        return .paymentInvalid
    case let price? where price <= 0 :
        return .paymentInvalid
    case let price? where price <= 1000000 :
        return .paymentSuccess
    default:
            return .paymentFailed
    }
}

func searchOrderByProductName(keyword: String?,orders: [Order]) -> SearchOrderStatus{
    let key = keyword?.lowercased()
    if key == nil || key == "" {
        return .emptyKeyword
    }
    let result = orders.first { order in
            order.products.contains { product in
                product.name.lowercased().contains(key!)
            }
        }
    if result != nil {
            return .found
        } else {
            return .notFound
        }
}

enum Screen {
    case login
    case orderList
    case orderDetail
    case payment
}

struct UiState {
    let screen: Screen
    let status: String
    let message: String
}

func uiState(from status: UserStatus) -> UiState {
    return UiState(
        screen: .login,
        status: String(describing: status),
        message: status.message
    )
}

func uiState(from status: OrderStatus) -> UiState {
    return UiState(
        screen: .orderList,
        status: String(describing: status),
        message: status.message
    )
}

func uiState(from status: TotalPriceStatus) -> UiState {
    return UiState(
        screen: .orderDetail,
        status: String(describing: status),
        message: status.message
    )
}

func uiState(from status: PaymentStatus) -> UiState {
    return UiState(
        screen: .payment,
        status: String(describing: status),
        message: status.message
    )
}

func uiState(from status: SearchOrderStatus) -> UiState {
    let screen: Screen = .orderList
    let statusString: String
    let message: String = status.message

    switch status {
    case .emptyKeyword:
        statusString = "error"
    case .found:
        statusString = "success"
    case .notFound:
        statusString = "empty"
    }

    return UiState(screen: screen, status: statusString, message: message)
}
func main() {

    let users = [
        User(id: 1, name: "Duc", isActive: true),
        User(id: 2, name: "Lan", isActive: false),
        User(id: 3, name: "Hai", isActive: true)
    ]
    let products = [
        Product(id: 1, name: "iphone", price: 500_000),
        Product(id: 2, name: "mac", price: 1_500_000),
        Product(id: 3, name: "chuột", price: -50_000),
        Product(id: 4, name: "bàn phím", price: 200_000)
    ]
    
    let orders = [
        Order(orderId: 1, userId: 1, products: [products[0], products[3]]),
        Order(orderId: 2, userId: 1, products: []),
        Order(orderId: 3, userId: 3, products: [products[2]])
    ]
    let userStatus1 = checkUserStatus(users: users, userId: 1)
    print("trạng thái người dùng:", userStatus1.message)
    
    let orderStatus1 = validateOrder(order: orders[0])
    print("trạng thái đơn hàng:", orderStatus1.message)
    calculateTotalPrice(products: orders[0].products) {
        priceStatus, total in
        print("tổng trạng thái đơn hàng:", priceStatus.message)
        if let totalPrice = total {
            let paymentStatus1 = payment(totalPrice: totalPrice)
            print("tổng giá:", totalPrice)
            print("trạng thái thanh toán:", paymentStatus1.message)
        }
    }
    
    let orderStatus2 = validateOrder(order: orders[1])
    print("trạng thái đơn hàng:", orderStatus2.message)
    
    calculateTotalPrice(products: orders[2].products) { priceStatus, total in
        print("trạng thái tổng thanh toán:", priceStatus.message)
    }
    
    let bigOrder = Order(orderId: 4, userId: 1, products: [products[1]])
    calculateTotalPrice(products: bigOrder.products) { priceStatus, total in
        print("trạng thái tổng thanh toán:", priceStatus.message)
        if let totalPrice = total {
            let paymentStatus = payment(totalPrice: totalPrice)
            print("tổng giá:", totalPrice)
            print("trạng thái thanh toán:", paymentStatus.message)
        }
    }
    
    let search1 = searchOrderByProductName(keyword: nil, orders: orders)
    print("keyword rỗng", search1.message)
    
    let search2 = searchOrderByProductName(keyword: "Iphone", orders: orders)
    print("Iphone", search2.message)
    
    let search3 = searchOrderByProductName(keyword: "Samsung", orders: orders)
    print("Samsung", search3.message)
}
main()
