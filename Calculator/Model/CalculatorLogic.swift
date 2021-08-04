//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Aleksandra Generowicz on 03/08/2021.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var calculationStoredData: (currentResult: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            if symbol == "AC" {
                return 0.0
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "+/-" {
                return n * -1
            } else if symbol == "=" {
                return count(number2: n)
            } else {
                self.calculationStoredData = (currentResult: n, operation: symbol)
                return n
            }
        }
        return nil
    }
    
    private func count(number2: Double) -> Double? {
        if let number1 = calculationStoredData?.currentResult,
           let symbol = calculationStoredData?.operation {
            switch symbol {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "X":
                return number1 * number2
            case "/":
                return number1 / number2
            default:
                return nil
            }
        }
        return nil
    }
    
}
