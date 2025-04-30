//
//  ViewController.swift
//  Chennagouni_PracticeExam01
//
//  Created by Shreyesh Chennagouni on 2/20/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightFeetOL: UITextField!
    
    @IBOutlet weak var heightInchesOL: UITextField!
    
    @IBOutlet weak var patientWeightOL: UITextField!
    
    @IBOutlet weak var outputOL: UILabel!
    
    
    @IBOutlet weak var imageOL: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func calculateBMIBtn(_ sender: Any) {
        
        //Taking the inputs from the Outlets
        guard let feet = Int(heightFeetOL.text ?? ""),
                              let inches = Int(heightInchesOL.text ?? ""),
                              let weight = Double(patientWeightOL.text ?? "") else {
            outputOL.text = "Please enter valid values."
                            return
                        }
        //converting the feet to inches
        let totalInches = (feet * 12) + inches
        //calculate the BMI using the given formula
        let bmi = (703 * weight) / pow(Double(totalInches), 2)
        //rounding the BMI values
        let roundedBMI = round(bmi * 10) / 10.0
              
        //adding more variables to store the output values
        var category = ""
        var healthTip = ""
        var imageNames = ""
        
        //using the if else cases to diplay the different outputs based on the roundedBMI values
        if roundedBMI <= 18.5 {
            category = "Underweight🪫"
            healthTip = "Eat more protein and healthy fats."
            imageNames = "underWeight"
        } else if roundedBMI >= 18.6 && roundedBMI <= 24.9 {
            category = "Normal👍"
            healthTip = "Excellent! Maintain a balanced lifestyle."
            imageNames = "normal"
        } else if roundedBMI >= 25 && roundedBMI <= 29.9 {
            category = "Overweight"
            healthTip = "Lose weight by maintaining a balanced diet and increasing physical activity."
            imageNames
            = "overWeight"
        } else if roundedBMI >= 30 {
            category = "Obese"
            healthTip = "Consult a doctor for personalized advice."
            imageNames = "obese"
        } else {
            category = "Unknown"
            healthTip = "Please enter valid values."
        }
        
        //displaying the text and image using the stored variables
        outputOL.text = "Your Body Mass Index is \(roundedBMI).\nThis is considered \(category).\nHealth tip: \(healthTip)"
        imageOL.image = UIImage(named: imageNames)

            
    }
    
}

