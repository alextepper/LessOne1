import Foundation

// Функция, строящая массив целых чисел заданного размера

func buildArray(_ size: Int) -> [Int] {
    var array: [Int] = []
    for n in 0...size-1 {
        array.append(n+1)
    }
    return array
}

// Функция, проверяющая, делится ли число на заданный делитель (Задание 1 и 2)

func divBy(_ number: Int, _ divBy: Int) -> Bool {
    var isEven: Bool     
    if number%divBy == 0 {
        isEven = true
    } else {
        isEven = false
    }
    return isEven
}

// Функция убирающая из массива числа, делящиеся на задданый делитель.

func removeExtra(_ arrayIn: [Int],_  divider: Int) -> [Int] {
    var arrayOut: [Int] = []
    arrayIn.forEach { number in
         if !divBy(number, divider) {
         arrayOut.append(number)
        }
    }
    return arrayOut
}

// Функция, доваляющая числа Фибоначи

func addFibonachi (_ arrayIn: inout [Int]) {
    for _ in (1...50){
        arrayIn.append(arrayIn[arrayIn.count - 1] + arrayIn[arrayIn.count - 2])
    }
}

// Функция убирающая из массива сложное число

func removeExtraComplex(_ arrayIn: [Int],_  divider: Int) -> [Int] {
    var arrayOut: [Int] = []
    arrayIn.forEach { number in
         if number < divider || number==divider || !divBy(number, divider){
            arrayOut.append(number)
        }
    }
    return arrayOut
}

// Функция, возвращаюшая массив без сложных чисел.

func removeComplex (_ arrayIn: [Int]) -> [Int]{
    var array: [Int] = arrayIn
    for i in 2...array.count {
        array = removeExtraComplex(array, i)
    }
    return array
}
// Создание Массива (Задание 3)

var array: [Int] = buildArray(100)

// Удаление из массива всех четных и делящихся на 3 чисел (Задание 4)

array = removeExtra(removeExtra(array, 3), 2)

// Добавление чисел Фибоначи в массив (Задание 5)

addFibonachi(&array)

print(array)

// Удаление из массива сложных чисел (Задание 6)

var arrayTwo: [Int] = buildArray(100)

arrayTwo = removeComplex(arrayTwo)

print(arrayTwo)

