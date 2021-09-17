import Foundation

// MARK: Добавление перечислений (Задание 3)

enum EngineType: String {
    case diesel = "Diesel Engine"
    case gas = "Gas Engine"
    case hybrid = "Hybrid Engine"
    case electric = "Electric Engine"
}

enum GearBox {
    case manual
    case automatic
    case robotic
}

enum BodyType {
    case roadster
    case coupe
    case sedan
    case suv
}

enum DriveMode {
    case economy
    case comfort
    case sport
}

enum CariageState {
    case latched
    case unlatched
}

// MARK: Описание класса Car с пустыми методами (Задание 1)

class Car {
    let producer: String
    let model: String
    let year: Int
    let engineType: EngineType
    let gear: GearBox
    init(producer: String, model: String, year: Int, engineType: EngineType, gear: GearBox){
        self.producer = producer
        self.model = model
        self.year = year
        self.engineType = engineType
        self.gear = gear
    }

    func switchMode() {
    }

    func unlatchTheCariage() {
    }

    func latchTheCariage() {
    }
}

// MARK: Описание наследников класса и добавление специфичных свойств для подлкассов (Задание 2)

class SportCar: Car {
    let bodyType: BodyType
    let doorCount: Int
    var driveMode: DriveMode

    init(producer: String, model: String, year: Int, engineType: EngineType, gear: GearBox, bodyType: BodyType, doorCount: Int, driveMode: DriveMode){
        self.bodyType = bodyType
        self.doorCount = doorCount
        self.driveMode = driveMode
        super.init(producer: producer, model: model, year: year, engineType: engineType, gear: gear)
    }

    func switchMode(_ mode: DriveMode) {
        self.driveMode = mode
        print("You are now in \(mode) mode")
    }
}

class TrunkCar: Car {
    let payload: Int
    var cariageState: CariageState

    init(producer: String, model: String, year: Int, engineType: EngineType, gear: GearBox, payload: Int, cariageState: CariageState){
        self.payload = payload
        self.cariageState = cariageState
        super.init(producer: producer, model: model, year: year, engineType: engineType, gear: gear)
    }

    // MARK: Переопределение методов согласно подклассу (Задание 4)

    override func unlatchTheCariage() {
        self.cariageState = .unlatched
        print("The cariage is unlatched")
    }

    override func latchTheCariage() {
        self.cariageState = .latched
        print("The cariage is latched")
    }
}

// MARK: Создание экзмепляров класса и применение к ним различных действий (Задание 5)

var honda = SportCar(producer: "Honda", model: "S2000", year: 2003, engineType: .gas, gear: .manual, bodyType: .roadster, doorCount: 2, driveMode: .sport)
var toyota = SportCar(producer: "Toyota", model: "Supra", year: 1999, engineType: .gas, gear: .manual, bodyType: .coupe, doorCount: 2, driveMode: .sport)

toyota.switchMode(.economy)

var volvo = TrunkCar(producer: "Volvo", model: "1500x", year: 2021, engineType: .hybrid, gear: .robotic, payload: 20000, cariageState: .unlatched)

volvo.latchTheCariage()


// MARK: Выведение значений свойств экземпляром в консоль (Задание 6)

dump(honda)
dump(toyota)
dump(volvo)

