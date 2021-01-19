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
    
    let calculator: Calculator = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculator.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func didClickNumbeicFunction(_ sender: UIButton){
        print(#function);
        self.calculator.inputNewNumber(sender.titleLabel?.text)

    }
    
    @IBAction private func didClickOperatorFunction(_ sender: UIButton){
        print(#function)
        self.calculator.inputNewOperator(sender.titleLabel?.text)
        print(self.operatorChar);
    }
    
    @IBAction private func didClickResultFunction(_ sender: UIButton){
        self.calculator.getResult()
    }
    
    @IBAction private func didClickResetFunction(_ sender: UIButton){
        self.calculator.reset()
    }

}


extension ViewController: CalculatorDelegate {
    
    func calculatorNoNumber() {
        print("There is no Number")
    }
    
    func calculatorNoOperator() {
        print("There is no Operator")
    }
    
    func calculatorNoResult() {
        print("There is no Result")
    }
    
    func calculatorDidChangeResult(_ result: Double) {
        self.resultLable?.text = "\(result)"
    }
    
}
