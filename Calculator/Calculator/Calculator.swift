//
//  Calculator.swift
//  Calculator
//
//  Created by LEED on 2021/01/19.
//

import Foundation

class Calculator {
    
    private var inputFirstNumberString: String = "";
    private var inputSecondNumberString: String = "";
    private var operatorString: String = "";
    private var resultText: String = "";
    
    func inputNewNumber(_ numberString: String) {
        if self.operatorString.isEmpty {
            self.inputFirstNumberString += numberString
            print("inputNumber1 ::: \(self.inputFirstNumberString)")
        } else {
            self.inputSecondNumberString += numberString
            print("inputNumber2 ::: \(self.inputSecondNumberString)")
        }
    }
    
    
    func inputNewOperator(_ newOperator: String) {
        self.operatorString = newOperator
    }
    
    func getResult() {
        guard !self.operatorString.isEmpty,
              let num1 = Double(self.inputFirstNumberString),
              let num2 = Double(self.inputSecondNumberString) else {
            print("-")
            return
        }
        
        if (self.operatorString == "+"){
            self.resultText = String(num1 + num2)
        }else if (self.operatorString == "-"){
            self.resultText = String(num1 - num2)
        }else if (self.operatorString == "x"){
            self.resultText = String(num1 * num2)
        }else if (self.operatorString == "/"){
            self.resultText = String(num1 / num2)
        }
        print("------ restult ------")
        print("\(num1) \(self.operatorString) \(num2) = \(self.resultText)")
        print("---------------------")
        self.inputFirstNumberString = self.resultText
        self.inputSecondNumberString = ""
        self.operatorString = ""
        print("inputNumber1 :: result :: \(self.inputFirstNumberString)")
    }
    
    func reset() {
        self.inputFirstNumberString = ""
        self.inputSecondNumberString = ""
        self.operatorString = ""
    }
}
