import Foundation

// MARK: Добавление перечислений с возмодными состояниями свойств структур (Задание 3)

enum EngineState {
    case on
    case off
}

enum WindowState {
    case open
    case closed
}

enum TrunkAction {
    case load
    case unload
}

// MARK: Описание страуткур SportCar и TrunkCar с содержанием указанных свойств (Задание 1, 2)

struct SportCar {
    let producer: String
    let year: Int
    let trunkValue: Double
    var engineState: EngineState
    var windowState: WindowState
    var loadedMass: Double
    var trunkLevel: Double {
        get {
            return loadedMass / trunkValue * 100
        }
    }

    mutating func powerButton() {
    switch self.engineState {
        case .on:
            self.engineState = .off
            print("You've just turned off your vehicle")
        case .off:
            self.engineState = .on
            print("You've just ignited your vehicle")
        }
    
    }

    mutating func windowButton() {
    switch self.windowState {
        case .closed:
            self.windowState = .open
            print("You've just opened your windows")
        case .open:
            self.windowState = .closed
            print("You've just closed your windows")
        }
    }

// MARK: Добавление метода с аргументом типа перечисления (Задание 4)

    mutating func manageTrunk(_ addition: Double, mode: TrunkAction){
        switch mode {
        case .load:
            self.loadedMass += addition 
            print("You've just added \(addition) kg to your trunk, your current load is \(self.trunkLevel)%")
        case .unload:
            self.loadedMass -= addition
            print("You've just removed \(addition) kg from your trunk, your current load is \(self.trunkLevel)%")
        }
        
    }

}

struct TrunkCar {
    let producer: String
    let year: Int
    let trunkValue: Double
    var engineState: EngineState
    var windowState: WindowState
    var loadedMass: Double
    var trunkLevel: Double {
        get {
            return loadedMass / trunkValue * 100
        }
    }

        mutating func powerButton() {
    switch self.engineState {
        case .on:
            self.engineState = .off
            print("You've just turned off your vehicle")
        case .off:
            self.engineState = .on
            print("You've just ignited your vehicle")
        }
    
    }

    mutating func windowButton() {
    switch self.windowState {
        case .closed:
            self.windowState = .open
            print("You've just opened your windows")
        case .open:
            self.windowState = .closed
            print("You've just closed your windows")
        }
    }

    mutating func manageTrunk(_ addition: Double, mode: TrunkAction){
        switch mode {
        case .load:
            self.loadedMass += addition 
            print("You've just added \(addition) kg to your trunk, your current load is \(self.trunkLevel)%")
        case .unload:
            self.loadedMass -= addition
            print("You've just removed \(addition) kg from your trunk, your current load is \(self.trunkLevel)%")
        }
        
    }

}

// MARK: Инизиализация нескольких экземпляров структур (Задание 5)

var ferrariF40 = SportCar(producer :"Ferrari", year: 1984, trunkValue: 15, engineState: .off, windowState: .closed, loadedMass: 5)
var porsche911 = SportCar(producer :"Porsche", year: 1991, trunkValue: 25, engineState: .off, windowState: .closed, loadedMass: 5)
var toyotaSupra = SportCar(producer :"Toyota", year: 1992, trunkValue: 50, engineState: .off, windowState: .closed, loadedMass: 5)
var dodgeRam = TrunkCar(producer :"Dodge", year: 2008, trunkValue: 500, engineState: .off, windowState: .closed, loadedMass: 5)
var fordF150 = SportCar(producer :"Ford", year: 2007, trunkValue: 550, engineState: .off, windowState: .closed, loadedMass: 5)

// MARK: Применение действий для изменения свойст экземпляров структур

porsche911.manageTrunk(20, mode: .load)
dodgeRam.manageTrunk(200, mode: .load)
fordF150.powerButton()

// MARK: Выведение на консоль свойств экземпляров структур (Задание 6)

print(toyotaSupra)
print(porsche911)
print(ferrariF40)
print(dodgeRam)
print(fordF150)





