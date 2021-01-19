//
//  ViewController.swift
//  Calculator
//
//  Created by 주민경 on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    private var inputFirstNumberString: String = "";
    private var inputSecondNumberString: String = "";
    private var operatorChar: String = "";
    private var resultText: String = "";
    
    @IBOutlet private weak var resultLable: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func didClickNumbeicFunction(_ sender: UIButton){
        print(#function);
        
        guard let newNumber = sender.titleLabel?.text else { return }
        
        if self.operatorChar.isEmpty {
            self.inputFirstNumberString += newNumber
            print("inputNumber1 ::: \(self.inputFirstNumberString)")
        } else {
            self.inputSecondNumberString += newNumber
            print("inputNumber2 ::: \(self.inputSecondNumberString)")
        }
        
    }
    
    @IBAction private func didClickOperatorFunction(_ sender: UIButton){
        guard let newOperator = sender.titleLabel?.text else { return }
        
        print(#function)
        self.operatorChar = newOperator
        print(self.operatorChar);
    }
    
    @IBAction private func didClickResultFunction(_ sender: UIButton){
        guard !self.operatorChar.isEmpty,
              let num1 = Double(self.inputFirstNumberString),
              let num2 = Double(self.inputSecondNumberString) else {
            print("-")
            return
        }
        
        if (self.operatorChar == "+"){
            self.resultText = String(num1 + num2)
        }else if (self.operatorChar == "-"){
            self.resultText = String(num1 - num2)
        }else if (self.operatorChar == "x"){
            self.resultText = String(num1 * num2)
        }else if (self.operatorChar == "/"){
            self.resultText = String(num1 / num2)
        }
        print("------ restult ------")
        print("\(num1) \(self.operatorChar) \(num2) = \(self.resultText)")
        print("---------------------")
        self.inputFirstNumberString = self.resultText
        self.inputSecondNumberString = ""
        self.operatorChar = ""
        print("inputNumber1 :: result :: \(self.inputFirstNumberString)")
    }
    
    @IBAction private func didClickResetFunction(_ sender: UIButton){
        self.inputFirstNumberString = ""
        self.inputSecondNumberString = ""
        self.operatorChar = ""
    }

}



