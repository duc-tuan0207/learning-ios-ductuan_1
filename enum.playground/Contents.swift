import UIKit

enum OrderStatus {
    case created
    case paid
    case shipping
    case dilivered
    case cancelled(reason: String)
}

func orderStatusDescription(status: OrderStatus) {
    switch status {
    case .created:
        print("Don hang cua ban tao thanh cong")
    case .paid:
        print("...")
    case .shipping:
        print("Da co shipper nhan giao ")
    case .dilivered:
        print("Don hang cua ban dang duoc van chuyen")
    case .cancelled(let n):
        print("da huy don thanh cong vi \(n)")
    }
}
orderStatusDescription(status: .created)
orderStatusDescription(status: .paid)
orderStatusDescription(status: .shipping)
orderStatusDescription(status: .dilivered)
orderStatusDescription(status: .cancelled(reason: "het tien"))



enum LoadState {
    case idle
    case loading
    case success(dataCount: Int)
    case empty
    case failure(errorMessage: String)
    
}
func handleLoadState(state: LoadState) {
    switch state {
    case .idle:
        print("ID la: 12321321321")
    case .loading:
        print("Dang xu ly du lieu cua ban")
    case .success(let data):
        print("du lieu cua ban:\(data)")
    case .empty:
        print("......")
    case .failure(let error):
        print("da xay ra loi vi :\(error)")
    }
}
handleLoadState(state: .idle)
handleLoadState(state: .loading)
handleLoadState(state: .success(dataCount : 1232122))
handleLoadState(state: .empty)
handleLoadState(state: .failure(errorMessage: "tai khoan cua ban bi sai"))


enum LoginError: Error {
    case emptyUsername
    case emptyPassword
    case passwordTooShort
    case invalidCredential
}
enum LoginResult {
    case success(massage: String)
    case failure(_ error: LoginError)
}
let usernameOrigin = "DucTuan"
let passwordOrign = "1234567"

func login(username: String, password: String) -> LoginResult {
    if (username == usernameOrigin && password == passwordOrign ){
        return .success(massage: "Ban da dang nhap thanh cong")
    }
    if (username.isEmpty) {
        return .failure(.emptyUsername)
    }
    if ( password.isEmpty) {
        return .failure(.emptyPassword)
    }
    if ( password.count < 6) {
        return .failure(.passwordTooShort)
    }
    return .failure(.invalidCredential)
}
func loginErrorMessage(with error: LoginError) {
    switch error {
    case .emptyUsername :
        print("Chua nhap tai khoan")
    case .emptyPassword :
        print("chua nhap mat khau")
    case .passwordTooShort :
        print("mat khau qua ngan")
    case .invalidCredential :
        print("mat khau khong dung")
    }
}
let test = login(username: "baba" , password: "123213")
switch test {
case .success(let message):
    print(message)
case .failure(let error):
    loginErrorMessage(with: error)
}



enum ShippingMethod {
    case standard(distanceKm: Int)
    case express(distanceKm: Int)
    case sameDay(distanceKm: Int)
}

func calculateShippingFee(method: ShippingMethod, orderAmount: Double) -> Double {
    if ( orderAmount > 10000000){
        return 0
    }
    switch method {
    case .standard(let Km):
        return Double(5000 * Km)
    case .express(let Km):
        return Double(20000 * Km)
    case .sameDay(let distanceKm):
        if ( distanceKm  < 4){
            return 0
        }else {
            return Double(distanceKm * 3000)
        }
    }
}
let phi = calculateShippingFee(method: .express(distanceKm: 150), orderAmount: 360000)
print(phi)


enum Route {
    case home
    case prodcut(productID: Int)
    case cart
    case checkout(isLoggeIn: Bool)
    case Login
}

func resolveRoute(route: Route){
    var statusLogin = false
    switch route {
    case .Login:
        print("ban hay dang nhap ")
        if ( statusLogin == true){
            print("ban da dang nhap thanh cong")
        }else {
            print("ban dang nhap khong thanh cong")
        }
    case .home:
        if(statusLogin == true) {
            print("ban dang trong man hinh chinh")
        }else{
            print("ban phai dang nhap truoc khi vao home")
        }
    case .prodcut(let productID):
        print("id cua san pham:\(productID)")
    case .cart:
        if(statusLogin == true) {
            
            print("Ban da vao gio hang thanh cong")
        }else{
            print("ban hay dang nhap truoc khi vao gio hang")
        }
    case .checkout(let isLoggeIn):
        if (isLoggeIn == statusLogin){
            print("ban da thanh toan thanh cong")
        }else{
            print("ban chua dang nhap")
        }
    }
}
resolveRoute(route: .Login)
resolveRoute(route: .home)
resolveRoute(route: .prodcut(productID: 123123))
resolveRoute(route: .cart)
resolveRoute(route: .checkout(isLoggeIn: true))

enum AccessState {
    case underAge
    case noTicket
    case allowed
}
func checkAccess(age: Int, hasTicket: Bool, state: AccessState){
    switch state {
    case .underAge :
        if (age < 18) {
            print("ban chua du tuoi!!!")
        }
    case .noTicket :
        if(age >= 18 && hasTicket == false){
            print("khong con ve")
        }
    case .allowed :
        if(age >= 18 && hasTicket == true) {
            print("ban mua ve thanh cong")
        }
    }
}
checkAccess(age: 19, hasTicket: false, state: .noTicket)

enum PaymentStatus {
    case idle
    case processing
    case success
    case failed(reason: String)
}
func paymentStatusMessage(status: PaymentStatus) -> String {
    switch status {
    case .idle:
        return "chua thanh toan"
    case .processing:
        return "thanh toan dang xu ly"
    case .success:
        return "thanh toan thanh cong"
    case .failed(let reason):
        return "thanh toan that bai vi: \(reason)"
    }
}
print(paymentStatusMessage(status: .idle))
print(paymentStatusMessage(status: .processing))
print(paymentStatusMessage(status: .failed(reason: "het tien")))

enum SettingsAction {
    case profile
    case notifications
    case appearance
    case help
    case logout
}
func handleSettingsAction(action: SettingsAction) -> String {
    switch action {
    case .profile:
        return "ban da vao trang ca nhan"
    case .notifications:
        return "ban da vao cai dat thong bao"
    case .appearance:
        return "ban dang o cai dat giao dien"
    case .help:
        return "ban can toi giup van de gi"
    case .logout:
        return "ban da dang xuat thanh cong"
    }
}
print(handleSettingsAction(action: .profile))
print(handleSettingsAction(action: .notifications))
print(handleSettingsAction(action: .appearance))
print(handleSettingsAction(action: .help))
print(handleSettingsAction(action: .logout))
