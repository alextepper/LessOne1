import Foundation

enum Material {
    case gold
    case silver
    case steel
}

enum KnifeType {
    case fish
    case bread
    case meat
    case vegetables
}

protocol Tableware {
    var material: Material { get set }
}

class Fork: Tableware {
    var material: Material
    let length: Int

    init(material: Material, length: Int ) {
        self.material = material
        self.length = length
    } 
}

class Spoon: Tableware {
    var material: Material
    let value: Double

    init(material: Material, value: Double ) {
        self.material = material
        self.value = value
    } 
}

class Knife: Tableware {
    var material: Material
    let knifeType: KnifeType

    init(material: Material, knifeType: KnifeType ) {
        self.material = material
        self.knifeType = knifeType
    } 
}

// MARK - Создание колекции типа Очередь с помощью дженериков (Задание 1)

struct Queue<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }

// MARK - Добавление метода, фильтрующего по передавемому аргументу (Задание 2)

    mutating func filter( predicate: (T) -> Bool ) {
        self.elements = self.elements.filter(predicate)
    }

// MARK - Добавление сабскриптинга, позволяющего вызывать элемент 
// очереди по индексу и предотвращающий ошибку при вызове
// несуществующего индекса (Задание 3)


    subscript(indices: Int) -> T? { 
        if indices > self.elements.count || indices < 0 {
            return nil
        } else {
            return self.elements[indices]
        }
    }


}

var spoonStack = Queue<Spoon>()
var forkStack = Queue<Fork>()
var knifeStack = Queue<Knife>()

spoonStack.push(Spoon(material: .gold, value: 12.5)) 
spoonStack.push(Spoon(material: .silver, value: 14.5)) 
spoonStack.push(Spoon(material: .steel, value: 9.5)) 
spoonStack.push(Spoon(material: .silver, value: 40.5)) 
spoonStack.push(Spoon(material: .steel, value: 60.5)) 
spoonStack.push(Spoon(material: .gold, value: 45.5)) 

forkStack.push(Fork(material: .silver, length: 15))
forkStack.push(Fork(material: .gold, length: 25))
forkStack.push(Fork(material: .steel, length: 65))

knifeStack.push(Knife(material: .silver, knifeType: .fish))
knifeStack.push(Knife(material: .gold, knifeType: .bread))
knifeStack.push(Knife(material: .steel, knifeType: .vegetables))



let condition: (Spoon) -> Bool = { (element: Spoon) -> Bool in
    return element.value > 20.0
}

let conditionTwo: (Spoon) -> Bool = { (element: Spoon) -> Bool in
    return element.material != .gold    
}

dump(spoonStack[2])
dump(spoonStack[8])

spoonStack.pop()

spoonStack.filter(predicate: conditionTwo)

dump(spoonStack)


dump(spoonStack)