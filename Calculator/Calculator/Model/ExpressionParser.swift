//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mene on 22/9/2022.
//

import Foundation

enum ExpressionParser {
        static func parse(from input: String) -> Formula {
            let components = componentsByOperators(from: input)
            let operandsQueue = components.compactMap{
                Double($0)
            }
            let operatorsQueue = components.compactMap{
                Operator(rawValue: Character($0))
            }
            let formula = Formula(operands: CalculatorItemQueue(enqueueStack: operandsQueue), operators: CalculatorItemQueue(enqueueStack: operatorsQueue))
    
            return formula
        }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var separators: CharacterSet = CharacterSet()
        
        Operator.allCases.forEach {
            separators.insert(charactersIn: String($0.rawValue))
        }
        
        let result = input.components(separatedBy: separators)
   
        return result
    }
}
