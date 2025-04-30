//
//  ViewController.swift
//  Chennagouni_Assignment02
//
//  Created by Shreyesh Chennagouni on 2/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var billAmountOutlet: UITextField!
    
    @IBOutlet weak var tipPercentageOutlet: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var billAmountLabel: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func SubmitBTN(_ sender: Any) {
        // variable input
        var name = nameOutlet.text!
        var billAmt = Double(billAmountOutlet.text!)!
        var tipPercentage = Double(tipPercentageOutlet.text!)!
        var tipAmt = billAmt * (tipPercentage / 100)
        var totalAmt = billAmt + tipAmt
        
        
        nameLabel.text = "Name: \(name)"
        billAmountLabel.text = "Bill Amount: $\(String(format: "%.2f", billAmt))"
        tipAmountLabel.text = "Tip Amount: $\(String(format: "%.2f", tipAmt))"
        totalAmountLabel.text = "Total Amount: $\(String(format: "%.2f", totalAmt))"
        
    }
    
    @IBAction func ResetBTN(_ sender: Any) {
        nameLabel.text = ""
        billAmountLabel.text = ""
        tipAmountLabel.text = ""
        totalAmountLabel.text = ""
        
    }
    
}

