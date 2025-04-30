//
//  ViewController.swift
//  Bmi_mvc
//
//  Created by Shreyesh Chennagouni on 3/25/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hFeetOL: UITextField!
  
    @IBOutlet weak var hInchesOL: UITextField!
    
    @IBOutlet weak var wLbsOL: UITextField!
    
    var feet=0
    var inches=0
    var lbs=0.0
    var bmi=0.0
    var categoryname=""
    var imgName=""
    var healthadvice=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBtn(_ sender: UIButton) {
        //read input and convert to integer
        feet=Int(hFeetOL.text!)!
        inches=Int(hInchesOL.text!)!
        lbs=Double(wLbsOL.text!)!
        
        var height=feet*12+inches
        bmi=703*(lbs/Double(height*height))
        
        if bmi<18.5
        {
            categoryname="Underweight"
            imgName="underWeight"
            healthadvice="Eat more protein and healthy fats"
        }
        else if bmi<25
        {
            categoryname="Normal"
            imgName="normal"
            healthadvice="Maintain a balanced diet"
        }
        else if bmi<30
        {
            categoryname="Overweight"
            imgName="overWeight"
            healthadvice="Reduce calorie intake and increase physical activity"
        }
        else{
            categoryname="Obese"
            imgName="obese"
            healthadvice="Prioritize weight loss through a combination of diet and exercise"
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition=segue.identifier
        if transition == "resultSegue"
        {
            var destination=segue.destination as! ResultViewController
            destination.enteredHfeet=feet
            destination.enteredHinches=inches
            destination.enteredWlbs=lbs
            destination.bmiResult=bmi
            destination.categoryMessage=categoryname
            destination.healthMessage=healthadvice
            destination.bmiImageName=imgName
            
        }
        
    }
    
}

