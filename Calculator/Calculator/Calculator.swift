//
//  Calculator.swift
//  Calculator
//
//  Created by LEED on 2021/01/19.
//

import Foundation

protocol CalculatorDelegate: class {
    func calculatorNoNumber()
    func calculatorNoOperator()
    func calculatorNoResult()
    func calculatorDidChangeResult(_ result: Double)
    
}

class Calculator {
    
    private var inputFirstNumberString: String = ""
    private var inputSecondNumberString: String = ""
    private var operatorString: String = ""
    private var resultText: String = ""
    
    weak var delegate: CalculatorDelegate?
    
    func inputNewNumber(_ numberString: String?) {
        guard let numberString = numberString else {
            self.delegate?.calculatorNoNumber()
            return
        }
        
        if self.operatorString.isEmpty {
            self.inputFirstNumberString += numberString
            print("inputNumber1 ::: \(self.inputFirstNumberString)")
            guard let newResult = Double(self.inputFirstNumberString) else { return }
            self.didChangeResult(self.inputFirstNumberString)
        } else {
            self.inputSecondNumberString += numberString
            print("inputNumber2 ::: \(self.inputSecondNumberString)")
            self.didChangeResult(self.inputSecondNumberString)
        }
    }
    
    
    func inputNewOperator(_ newOperator: String?) {
        guard let newOperator = newOperator else {
            self.delegate?.calculatorNoOperator()
            return
        }
        self.operatorString = newOperator
    }
    
    func getResult() {
        guard !self.operatorString.isEmpty,
              let num1 = Double(self.inputFirstNumberString),
              let num2 = Double(self.inputSecondNumberString) else {
            self.delegate?.calculatorNoResult()
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
        self.didChangeResult(self.resultText)
        print("inputNumber1 :: result :: \(self.inputFirstNumberString)")
    }
    
    func reset() {
        self.inputFirstNumberString = ""
        self.inputSecondNumberString = ""
        self.operatorString = ""
    }
}

private extension Calculator {
    
    func didChangeResult(_ resultString: String) {
        guard let newResult = Double(resultString) else { return }
        
        self.delegate?.calculatorDidChangeResult(newResult)
    }
    
}
