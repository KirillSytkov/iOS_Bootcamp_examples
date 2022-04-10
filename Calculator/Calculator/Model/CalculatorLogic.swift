
import Foundation
import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate( symbol: String) -> Double? {
        guard let number = number else {
            return nil
        }
        switch symbol {
            case "+/-": return number * -1
            case "AC": return 0
            case "%": return  number * 0.01
            case "=": return perfotmTwoNumberCalculation(n2: number)
            default: intermediateCalculation = (number, symbol)
        }
        return nil
    }
    
    private func perfotmTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
                case "+": return n1 + n2
                case "-": return n1 - n2
                case "×": return n1 * n2
                case "÷": return n1 / n2
                default:
                    break
                }
        }
        return nil
    }
}
