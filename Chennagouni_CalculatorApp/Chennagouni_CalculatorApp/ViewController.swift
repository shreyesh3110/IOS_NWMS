//
//  ViewController.swift
//  Chennagouni_CalculatorApp
//
//  Created by Shreyesh Chennagouni on 2/24/25.
//

import UIKit

class ViewController: UIViewController {

    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var currentOperation: String = ""
    var isWaitingForSecondNumber: Bool = false
    
    @IBOutlet weak var resultOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultOutlet.text! = "0"
    }

    
    @IBAction func zeroBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "0"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "0"
                } else {
                    resultOutlet.text! += "0"
                }
            }
    }
    
    @IBAction func oneBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "1"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "1"
                } else {
                    resultOutlet.text! += "1"
                }
            }
    }
    
    @IBAction func twoBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "2"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "2"
                } else {
                    resultOutlet.text! += "2"
                }
            }
    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "3"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "3"
                } else {
                    resultOutlet.text! += "3"
                }
            }
    }
    
    @IBAction func fourBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "4"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "4"
                } else {
                    resultOutlet.text! += "4"
                }
            }
    }
    
    @IBAction func fiveBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "5"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "5"
                } else {
                    resultOutlet.text! += "5"
                }
            }
    }
    
    @IBAction func sixBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "6"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "6"
                } else {
                    resultOutlet.text! += "6"
                }
            }
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "7"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "7"
                } else {
                    resultOutlet.text! += "7"
                }
            }
    }
    
    @IBAction func eightBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "8"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "8"
                } else {
                    resultOutlet.text! += "8"
                }
            }
    }
    
    @IBAction func nineBtn(_ sender: UIButton) {
        if isWaitingForSecondNumber {
                resultOutlet.text = "9"
                isWaitingForSecondNumber = false
            }
        else {
                if resultOutlet.text == "0" || resultOutlet.text == "" {
                    resultOutlet.text = "9"
                } else {
                    resultOutlet.text! += "9"
                }
            }
    }
    
    @IBAction func equalsBtn(_ sender: UIButton) {
        secondNumber = Double(resultOutlet.text!) ?? 0
        var result: Double = 0
        
        switch currentOperation {
        case "+": result = firstNumber + secondNumber
        case "-": result = firstNumber - secondNumber
        case "*": result = firstNumber * secondNumber
        case "/":
            if(secondNumber == 0){
                resultOutlet.text = "nan"
                return
            }
            else {
                result = firstNumber / secondNumber
            }
        case "%":
            result = (firstNumber.truncatingRemainder(dividingBy: secondNumber))
            resultOutlet.text = String(format: "%.1f" , result)
            return;
        default: break
        }
//        if(result != Double(Int(result))){
//            resultOutlet.text = String((result))
//        }
//        else{
//            resultOutlet.text = String(Int(result))
//        }
//        firstNumber = result
//        isWaitingForSecondNumber = true
        // Display the result without decimals if it's an integer
                if result.truncatingRemainder(dividingBy: 1) == 0 {
                    resultOutlet.text = String(format: "%.0f", result)
                } else {
                    resultOutlet.text = String(format: "%.2f", result)
                }
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        firstNumber = Double(resultOutlet.text!) ?? 0
        currentOperation = "+"
        isWaitingForSecondNumber = true
    }
    
    @IBAction func subtractBtn(_ sender: UIButton) {
        firstNumber = Double(resultOutlet.text!) ?? 0
        currentOperation = "-"
        isWaitingForSecondNumber = true
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        firstNumber = Double(resultOutlet.text!) ?? 0
        currentOperation = "*"
        isWaitingForSecondNumber = true
    }
    
    @IBAction func divideBtn(_ sender: UIButton) {
        firstNumber = Double(resultOutlet.text!) ?? 0
        currentOperation = "/"
        isWaitingForSecondNumber = true
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        resultOutlet.text = "0"
    }
    
    @IBAction func decimalBtn(_ sender: UIButton) {
        resultOutlet.text! += "."
    }
    
    @IBAction func percentageBtn(_ sender: UIButton) {
        firstNumber = Double(resultOutlet.text!) ?? 0
        currentOperation = "%"
        isWaitingForSecondNumber = true
    }
    
    @IBAction func signchangeBtn(_ sender: UIButton) {
        if let lastChar = resultOutlet.text?.last, "+-*/%".contains(lastChar) {
                resultOutlet.text!.removeLast()
                resultOutlet.text! += lastChar == "-" ? "+" : "-"
            } else if var value = Int(resultOutlet.text!) {
                value *= -1
                resultOutlet.text = String(value)
            }
    }
    
    @IBAction func allclearBtn(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        currentOperation = ""
        resultOutlet.text = "0"
    }
}

