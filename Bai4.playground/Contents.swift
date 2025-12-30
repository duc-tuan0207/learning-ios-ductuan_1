import UIKit

struct TypeCar{
    let id: Int
    let name: String
    let numbersOfWheel: Int
}

struct Car {
    let id: Int
    let name: String
    let color: String
    let typeCar: TypeCar
}

let typeCars : [TypeCar] = [TypeCar(id: 1,name:"Sedan",numbersOfWheel:4),
                            TypeCar(id: 2, name:"SUV",numbersOfWheel:4),
                            TypeCar(id: 3, name:"Truck",numbersOfWheel:6)]
guard let sedan = typeCars.first(where: { $0.name == "Sedan" }) else { fatalError("Not found Sedan") }
guard let suv = typeCars.first(where: { $0.name == "SUV" }) else { fatalError("Not found Sedan") }
guard let truck = typeCars.first(where: { $0.name == "Truck" }) else { fatalError("Not found Sedan") }


let cars : [Car] = [
    Car.init(id: 1,name: "CarA",color: "Red",typeCar: sedan),
    Car.init(id: 2, name: "CarB", color: "Black",typeCar: sedan),
    Car.init(id: 3, name: "CarC", color: "Red",typeCar: suv),
    Car.init(id: 4, name: "CarD", color: "White", typeCar: suv),
    Car.init(id: 5, name: "CarE", color: "Black",typeCar: truck),
    Car.init(id: 6, name: "CarF", color: "Red", typeCar: truck)
]
print(cars)
print("\n")
func carRedAnd4Wheel (){
    let redCars = cars.filter{
        $0.color == "Red" && $0.typeCar.numbersOfWheel == 4
    }
    guard !redCars.isEmpty else {
        print("Không có xe màu đỏ và 4 bánh")
        return
    }
    print(redCars)
}
print(carRedAnd4Wheel())

let DanhsachXe:[String] = ["CarA","CarB","CarC","CarD","CarE","CarF"]

print(DanhSachXe)
