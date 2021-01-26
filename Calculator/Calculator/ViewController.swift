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
    @IBOutlet private var numbericButtonTableView: UITableView?
    
    let calculator: Calculator = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculator.delegate = self
        self.setupTableView()
        
        let plusedData = self.testCaseCalaulatePlusOne(0)
        let doubledData = self.doubleOnBase(plusedData)
        // Do any additional setup after loading the view.
    }
    
    func testCaseCalaulatePlusOne(_ base: Int) -> Int {
        let result = base + 1
        return result
    }
    
    func doubleOnBase(_ base: Int) -> Int {
        let result = base * 2
        return result
    }
}

private extension ViewController {
    
    func setupTableView() {
        self.numbericButtonTableView?.delegate = self
        self.numbericButtonTableView?.dataSource = self
        self.numbericButtonTableView?.isScrollEnabled = false
        self.numbericButtonTableView?.separatorStyle = .none
        self.numbericButtonTableView?.register(UINib(nibName: "NumbericTableViewCell", bundle: nil),
                                               forCellReuseIdentifier: "NumbericTableViewCell")
        self.numbericButtonTableView?.register(UINib(nibName: "ResetAllTableViewCell", bundle: nil),
                                               forCellReuseIdentifier: "ResetAllTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 4 : 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.height
        let heightInt = Int(height)
        let heightString = Int("가나다라")
        
        return tableView.frame.height / 5.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            let numbericCell = tableView.dequeueReusableCell(withIdentifier: "NumbericTableViewCell", for: indexPath) as? NumbericTableViewCell
            numbericCell?.setupBasicNumber(indexPath)
            numbericCell?.delegate = self
            return numbericCell ?? cell
        } else {
            let resetAllCell = tableView.dequeueReusableCell(withIdentifier: "ResetAllTableViewCell", for: indexPath) as? ResetAllTableViewCell
            return resetAllCell ?? cell
        }
    }
}

extension ViewController: NumbericTableViewCellDelegate {
    
    func numbericTableViewCell(_ tableViewCell: NumbericTableViewCell, didSelect button: UIButton) {
        print("\(#function) buttonTitle: \(button.titleLabel?.text)")
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
