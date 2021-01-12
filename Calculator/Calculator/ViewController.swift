//
//  ViewController.swift
//  Calculator
//
//  Created by LEED on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var numbericButton1: UIButton?
    @IBOutlet private weak var numbericButton2: UIButton?
    
    private var preNumber: Int?
    private var operatorSymbol: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test()
        
        print(#function)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }


    var result1 = 0
    var result2 = 0
    
    func test() {
        print(#function)
        
        print(self.numbericButton1?.titleLabel?.text)

        result1 += 1
        result1 = result1 + 1
        
        result1 = 10
        
        let compare1to1 = 1 == 1
        let compareAAtoAA = "aa" == "aa"
        let compareAAtoBB = "aa" != "bb"
        let compareAAtoBB_ = "aa" == "bb"
        let memory2CompareResult1toResult2 = result1 == result2
        
        print(memory2CompareResult1toResult2)
    }
    
    private func isEnableToCalculate() -> Bool {
        if preNumber != nil, operatorSymbol != nil {
            return true
        } else {
            return false
        }
        
        self.testA(aa: "aa")
        self.testB("bb")
        self.testC(with: "cc")
    }
    
    func testA(aa: String) {
        print(aa)
    }
    
    func testB(_ bb: String) {
        print(bb)
    }
    
    func testC(with cc: String) {
        print(cc)
        
        self.calculateIfNeedeed(number: 1)
        self.calculatePosition(self.view,
                               from: self.view.frame.origin,
                               to: CGPoint(x: 100, y: 100))
    }

    
    func calculatePosition(_ view: UIView, from A: CGPoint, to B: CGPoint) {
        
    }
    
    func testE(A: String, B: String) {
        
    }
    
    func testF(_ F: String, G: String) {
        
    }
    
    private func calculateIfNeedeed(number: Int) {
        
    }
    
    private func calculateIfNeeded(with number: Int) {
        if self.isEnableToCalculate() {
            self.willCalculate(with: number)
        } else {
            preNumber = number
        }
    }
    
    private func willCalculate(with nextNumber: Int) {
        if self.operatorSymbol == "+" {
            self.preNumber! += nextNumber
            
        } else if self.operatorSymbol == "-" {
            self.preNumber! -= nextNumber
        }
        
        print("result: \(self.preNumber)")
    }
    
    // MARK: - Actions
    @IBAction private func didClickNumberButton1(_ sender: UIButton) {
        print(#function)
        let senderText = sender.titleLabel!.text!
        print("senderText: \(senderText)")
        let number = Int(senderText)!
        print("number: \(number)")
        
        self.calculateIfNeeded(with: number)
    }
    
    @IBAction private func didClickNumberButton2(_ sender: UIButton) {
        // 2번 버튼을 클릭할때 동작하는 함수입니다.
        print(#function)
        let senderText = sender.titleLabel!.text!
        let number = Int(senderText)!
        self.calculateIfNeeded(with: number)
//        if preNumber != nil, operatorSymbol != nil {
//            // 계산
//            self.willCalculate(number)
//        } else {
//            preNumber = number
//        }
    }
    
    
    @IBAction private func didClickOperatorPlus(_ sender: UIButton) {
        print(#function)
        self.operatorSymbol = sender.titleLabel?.text
        
        print("operatorSymbol: \(self.operatorSymbol)")
    }
    
    @IBAction private func didClickOperatorMinus(_ sender: UIButton) {
        print(#function)
        self.operatorSymbol = sender.titleLabel?.text
        print("operatorSymbol: \(self.operatorSymbol)")
    }
    
}

