//
//  calculatorModel.swift
//  Calculator
//
//  Created by Zachary Swoveland on 3/25/23.
//

import Foundation
import SwiftUI

enum Keys:String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case clear = "AC"
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "X"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor:Color {
        switch self{
        case .add, .substract, .multiply,.divide,.equal:
            return Color("Voperator")
        case .clear, .negative, .percent:
            return Color("num")
        default:
            return Color("num")
        }
    }
}

enum Operation{
    case add,substract,multiply, divide, none
}
