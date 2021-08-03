//
//  ViewController.swift
//  Calculator
//
//  Created by Aleksandra Generowicz on 03/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber = true
    
    //Computed property
    private var displayValue: Double {
        get {
            guard let currentNumber = Double(displayLabel.text!) else {
                fatalError("Current value cannot be convert to Double")
            }
            return currentNumber
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func symbolButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        let calculatorModel = CalculatorLogic(number: displayValue)
        
        if let calcMethod = sender.currentTitle {
            guard let result = calculatorModel.calculate(symbol: calcMethod) else {
                fatalError("Cannot get the result of operation")
            }
            displayValue = result
        }
        
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numberValue
                isFinishedTypingNumber = false
            } else {
                if numberValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += numberValue
            }
        }
        
    }
    

}

