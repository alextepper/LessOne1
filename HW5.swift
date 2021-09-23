import Foundation

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

enum WindowDoorState {
    case closed
    case open
}

enum Ignition {
    case on
    case off
}

// MARK - Создание протокола с описанием общих для всех автомобилей свойств (Задание 1)

protocol CarProtocol {
    var producer: String { get set }
    var model: String { get set }
    var year: Int { get set }
    var engineType: EngineType { get set }
    var gear: GearBox { get set }
    var doorState: WindowDoorState { get set }
    var windowState: WindowDoorState { get set }
    var ignition: Ignition { get set }
}

// MARK - Расширение протокола для добавления общих функций (Задание 2)
    
extension CarProtocol {
    mutating func openTheDoors() {
        self.doorState = .open
        print("You opened your \(self.producer)'s doors")
    }

    mutating func closeTheDoors() {
        self.doorState = .closed
        print("You closed your \(self.producer)'s doors")
        
    }

    mutating func openTheWindows() {
        self.windowState = .open
        print("You opened your \(self.producer)'s windows")
        
    }

    mutating func closeTheWindows() {
        self.windowState = .closed
        print("You closed your \(self.producer)'s windows")
        
    }

    mutating func powerButton() {
        self.ignition = self.ignition == .on ? .off : .on
        print("You have turned \(self.ignition) your \(self.producer)") 
    }
}

// MARK - Создание двух классов, имплементирующих протокол CarProtocol (Задание 3)

class SportCar: CarProtocol {
    var producer: String
    var model: String
    var year: Int
    var engineType: EngineType
    var gear: GearBox
    var doorState: WindowDoorState
    var windowState: WindowDoorState
    var ignition: Ignition
    var bodyType: BodyType
    var doorCount: Int
    var driveMode: DriveMode

    init(producer: String,
        model: String,
        year: Int,
        engineType: EngineType,
        gear: GearBox,
        doorState: WindowDoorState,
        windowState: WindowDoorState,
        ignition: Ignition,
        bodyType: BodyType,
        doorCount: Int,
        driveMode: DriveMode) {
            self.producer = producer
            self.model = model
            self.year = year
            self.engineType = engineType
            self.gear = gear
            self.windowState = windowState
            self.doorState = doorState
            self.ignition = ignition
            self.bodyType = bodyType
            self.doorCount = doorCount
            self.driveMode = driveMode
        
    }
}

extension SportCar {
func switchMode(_ mode: DriveMode) {
    self.driveMode = mode
    print("You are now in \(mode) mode")
    }
}

// MARK - Добавление расширения имплементирующее протокол CustomStringConvertible в классы (Задание 4)

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Your \(producer) \(model)(\(year)) has a \(engineType.rawValue) and \(gear) gearbox, right now it's windows are \(windowState), doors are \(doorState) and the engine is turned \(ignition)."
    }
}

class TrunkCar: CarProtocol {
    var producer: String
    var model: String
    var year: Int
    var engineType: EngineType
    var gear: GearBox
    var doorState: WindowDoorState
    var windowState: WindowDoorState
    var ignition: Ignition
    var payload: Int
    var cariageState: CariageState

    init(producer: String,
        model: String,
        year: Int,
        engineType: EngineType,
        gear: GearBox,
        doorState: WindowDoorState,
        windowState: WindowDoorState,
        ignition: Ignition,
        payload: Int,
        cariageState: CariageState){
        
        self.producer = producer
        self.model = model
        self.year = year
        self.engineType = engineType
        self.gear = gear
        self.windowState = windowState
        self.doorState = doorState
        self.ignition = ignition
        self.payload = payload
        self.cariageState = cariageState
    }

    func unlatchTheCariage() {
        self.cariageState = .unlatched
        print("The cariage is unlatched")
    }

    func latchTheCariage() {
        self.cariageState = .latched
        print("The cariage is latched")
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Your \(producer) \(model)(\(year)) has a \(engineType.rawValue) and \(gear) gearbox, right now it's windows are \(windowState), doors are \(doorState) and the engine is turned \(ignition)."
    }
}

// MARK - Создание объектов класса и применение к ним действий (Задание 5)

var honda = SportCar(producer: "Honda",
                    model: "S2000",
                    year: 1992,
                    engineType: .gas,
                    gear: .manual,
                    doorState: .closed,
                    windowState: .open,
                    ignition: .off,
                    bodyType: .coupe,
                    doorCount: 2,
                    driveMode: .sport)

var dodge = TrunkCar(producer: "Dodge",
                    model: "Ram",
                    year: 2008,
                    engineType: .diesel,
                    gear: .automatic,
                    doorState: .closed,
                    windowState: .open,
                    ignition: .off,
                    payload: 1000,
                    cariageState: .unlatched)

// MARK - печать объектов в консоль (Задание 6) 

print(honda)
honda.powerButton()
honda.closeTheWindows()
honda.openTheDoors()
print(honda)
print(dodge)
dodge.powerButton()
dodge.closeTheWindows()
dodge.openTheDoors()
print(dodge)















