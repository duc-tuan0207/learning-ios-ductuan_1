import Foundation

struct Order {
    let id : String
    var amount :Double
}
enum PaymentStatus {
    case success
    case failed(reason : String)
}
protocol PaymentMethod {
    var name : String {get}
    func pay(order : Order) -> PaymentStatus
}
extension PaymentMethod {
    func printResult(for order : Order) {
        let status = pay(order: order)
        switch status {
        case .success:
            print("\(name) Order\(order.id) Success\(order.amount)")
        case .failed(let reason):
            print("\(name) Order\(order.id) Failed\(order.amount) reason\(reason)")
        }
    }
}
struct CashPayment:PaymentMethod {
    let name:String = "Cash"
    func pay(order:Order) -> PaymentStatus {
        return .success
    }
}
struct CardPayment:PaymentMethod {
    let limit : Double
    let name : String = "Card"
    func pay(order : Order) -> PaymentStatus {
        guard order.amount <= limit else {
            return .failed(reason: "Bạn không đủ hạn mức")
        }
        return .success
    }
}

let orderA = Order(id: "A001", amount: 36000)
let orderB = Order(id: "A002", amount: 360000000000000000000)

let cash = CashPayment()
let card = CardPayment(limit: 360000000000)

cash.printResult(for: orderA)
cash.printResult(for: orderB)
card.printResult(for: orderB)





struct Message {
    var title : String
    var body : String
}
protocol Notifiable {
    var channelName: String {get}
    func send(_ message: Message) -> Bool
}
struct EmailNotifier : Notifiable {
    let channelName = "Email"
    func send(_ message : Message) -> Bool {
        print("Email send \(message.title) - NoiDung\(message.body)")
        return true
    }
}
struct SMSNotifier : Notifiable {
    let channelName = "SMS"
    func send(_ message : Message) -> Bool {
        print("SMS \(message.title) - NoiDung\(message.body)")
        return true
    }
}
struct ConsoleNotifier : Notifiable {
    let channelName = "Console"
    func send(_ message : Message) -> Bool {
        print("Console \(message.title) - NoiDung\(message.body)")
        return true
    }
}
extension Notifiable {
    func PrintResult(for message : Message) {
        let status = send(message)
        if(status){
            print("Gửi thành công \(message.title) - NoiDung\(message.body)")
        }else {
            print("Gửi không thành công đã bị lỗi  \(message.title) - NoiDung\(message.body)")
        }
    }
}

let letter1 = Message(title: "Thư Tình", body: "ádasdasdasdasdas")
let letter2 = Message(title: "Thư Trả nợ", body: "Hết tiền rồiiiiii")
let letter3 = Message(title: "Thư đòi nợ", body: "trả tiền cho tuiii điiiii")

let sms = SMSNotifier()
let email = EmailNotifier()
let console = ConsoleNotifier()

sms.PrintResult(for: letter1)
email.PrintResult(for: letter2)
console.PrintResult(for: letter3)




struct Product {
    let name : String
    let price : Double
}
protocol Pricable  {
    var price : Double {get}
}
extension Product : Pricable {}

extension Pricable {
    func discount (giamgia : Double ) -> Double {
        return price * (1 - giamgia / 100)
    }
}
func totalPrice<pricable : Pricable> (of items : [pricable]) -> Double {
    var total : Double = 0
    
    for item in items {
        total +=  item.price
    }
    return total
}



let item1 = Product(name: "Laptop", price: 36000)
let item2 = Product(name: "Phone", price: 1000000)
let item3 = Product(name: "Ipad", price: 88888)

let products = [item1, item2, item3]

let sum = totalPrice(of: products)
print("Tong tien\(sum)")
let giam = item1.discount(giamgia: 10)
print(giam)
