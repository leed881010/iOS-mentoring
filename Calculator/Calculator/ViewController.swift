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
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func didClickNumbeicFunction(_ sender: UIButton){
        print(#function);
        
        guard let newNumberString = sender.titleLabel?.text else { return }
        self.calculator.inputNewNumber(newNumberString)

    }
    
    @IBAction private func didClickOperatorFunction(_ sender: UIButton){
        guard let newOperator = sender.titleLabel?.text else { return }
        
        print(#function)
        self.calculator.inputNewOperator(newOperator)
        print(self.operatorChar);
    }
    
    @IBAction private func didClickResultFunction(_ sender: UIButton){
        self.calculator.getResult()
    }
    
    @IBAction private func didClickResetFunction(_ sender: UIButton){
        self.calculator.reset()
    }

}

