//
//  ViewController.swift
//  Chennagouni_Exam02
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var goalTypeOL: UITextField!
    
    @IBOutlet weak var targetAmountOL: UITextField!
    
    @IBOutlet weak var rateOL: UITextField!
    
    @IBOutlet weak var timeOL: UITextField!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    var goalType=""
    var targetAmount=0.0
    var rate=0.0
    var years=0.0
    var imageName=""
    
    var totalMonths=0.0
    var monthlyInterestRate=0.0
    var monthlySavingsPayment=0.0
    var answer=0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        goalTypeOL.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        targetAmountOL.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        rateOL.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        timeOL.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        
        calculateBtn.isEnabled=false
        resetBtn.isEnabled=false
    }
    @objc func textFieldsChanged() {
        let isAllFilled = !(goalTypeOL.text?.isEmpty ?? true) &&
        !(targetAmountOL.text?.isEmpty ?? true) &&
        !(rateOL.text?.isEmpty ?? true) &&
        !(timeOL.text?.isEmpty ?? true)
            
            calculateBtn.isEnabled = isAllFilled
            resetBtn.isEnabled = isAllFilled
        }
    
    @IBAction func calculateBtnClicked(_ sender: UIButton) {
        goalType=goalTypeOL.text!
        targetAmount=Double(targetAmountOL.text!)!
        rate=Double(rateOL.text!)!
        years=Double(timeOL.text!)!
        
        totalMonths=years*12
        monthlyInterestRate=(rate/100)/12
        monthlySavingsPayment=targetAmount/((pow(1+monthlyInterestRate,totalMonths)-1)/monthlyInterestRate)
        
        answer=round(monthlySavingsPayment * 100) / 100
        
        if goalType=="car"
        {
            imageName="car"
        }
        else if goalType=="vacation"
        {
            imageName="vacation"
        }
        else if goalType=="home"
        {
            imageName="home"
        }
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        goalTypeOL.text=""
        targetAmountOL.text=""
        rateOL.text=""
        timeOL.text=""
        calculateBtn.isEnabled=false
        resetBtn.isEnabled=false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition=segue.identifier
        if transition=="ResultSegue"
        {
            var destination=segue.destination as! ResultViewController
            destination.enteredGoalType=goalType
            destination.enteredTargetAmount=targetAmount
            destination.enteredRate=rate
            destination.result=answer
            destination.resultImgName=imageName
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Reset all input fields
        goalTypeOL.text = ""
        targetAmountOL.text = ""
        rateOL.text = ""
        timeOL.text = ""
           
        //calculateBtn.isEnabled = false
        //resetBtn.isEnabled = false
        
        }

    
}

