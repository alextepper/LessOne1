//
//  main.swift
//  LessOne1
//
//  Created by asd on 06/09/2021.
//

import Foundation

// Решение квадратного уравнения

let a: Double = 5
let b: Double = 8
let c: Double = 2

let equation: String = "\(a)x^2+\(b)x+\(c)=0"

print(equation)
var dis: Double = b*b-(4*c*a)
if (dis>0){
    let x1 = (-b+sqrt(dis))/2*a
    let x2 = (-b-sqrt(dis))/2*a
    print("The equation has two solutions: x1=\(x1) and x2=\(x2)")
    } else if (dis == 0){
        let x = -b/(2*a)
        print("The equation has only one solution: x=\(x)")
    } else{
        print("The equation has no solution")
    }

// Нахождение гипотенузы, периметра и площади треугольника

let katet1: Double = 5
let katet2: Double = 7
// гипотенуза
let hypotenuse: Double = sqrt(katet1*katet1 + katet2*katet2)

// периметр
let perimeter = katet1+katet2+hypotenuse

// площадь
let area = (katet2*katet1)/2

print("В треугольнике с катетами \(katet1) и \(katet2) гиптенуза будет равна \(hypotenuse), периметр равен \(perimeter) а площадь \(area)")


// Нахождение суммы вклада через 5 лет

var doubleSum: Double = 0
var doubleInterest: Double = 0

print("Введите сумму которую хотите вложить:")
let summ = readLine()

if let unwrapped = summ {
    if let cost = Double(unwrapped) {
        print("The user entered a value price of \(cost)")
        doubleSum = cost
    } else {
        print("Not a valid number: \(unwrapped)")
    }
} else {
    print("not string")
}

print("Введите процент который предлагает банк:")
var interest = readLine()

if let unwrapped = interest {
    if let cost = Double(unwrapped) {
        print("The user entered a value price of \(cost)")
        doubleInterest = cost
    } else {
        print("Not a valid number: \(unwrapped)")
    }
} else {
    print("not string")
}

let multiplier = doubleInterest/1200+1
let result = pow(multiplier, 60) * doubleSum

print("Через 5 лет вы будете иметь \(result) $ на вашем счете")

