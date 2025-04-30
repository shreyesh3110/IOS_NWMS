//
//  ViewController.swift
//  practice_for_exam
//
//  Created by Shreyesh Chennagouni on 4/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityOL: UITextField!
    
    @IBOutlet weak var durationOL: UITextField!
    
    @IBOutlet weak var caloriesOL: UITextField!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    var activityType=""
    var duration=0.0
    var calories=0.0
    var totalCaloriesBurned=0.0
    var imageName=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //calculateBtn.isEnabled=false
        
        calculateBtn.isEnabled = false // Initially disable the button

                // Add target actions to text fields to check input validation
                activityOL.addTarget(self, action: #selector(validateInput), for: .editingChanged)
                durationOL.addTarget(self, action: #selector(validateInput), for: .editingChanged)
                caloriesOL.addTarget(self, action: #selector(validateInput), for: .editingChanged)
            }
    @objc func validateInput() {
            // Ensure all fields are filled and valid
            if let activityText = activityOL.text, !activityText.isEmpty,
               let durationText = durationOL.text, let durationValue = Double(durationText),
               let caloriesText = caloriesOL.text, let caloriesValue = Double(caloriesText),
               durationValue > 0, caloriesValue > 0 {
                calculateBtn.isEnabled = true
            } else {
                calculateBtn.isEnabled = false
            }
    }

    @IBAction func calculateBtnClicked(_ sender: UIButton) {
        activityType=activityOL.text!
        duration=Double(durationOL.text!)!
        calories=Double(caloriesOL.text!)!
        totalCaloriesBurned=calories*duration
        if activityOL.text=="" || durationOL.text=="" || caloriesOL.text==""
        {
            calculateBtn.isEnabled=false
        }
        else
        {
            calculateBtn.isEnabled=true
        }
        
        if activityType=="running"
        {
            imageName="running"
        }
        else if activityType=="cycling"
        {
            imageName="cycling"
        }
        else if activityType=="swimming"
        {
            imageName="swimming"
        }
        else
        {
            imageName="default"
        }
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        activityOL.text=""
        durationOL.text=""
        caloriesOL.text=""
        calculateBtn.isEnabled=false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var transition=segue.identifier
        if transition=="ResultSegue"
        {
            var destination=segue.destination as! ResultViewController
            destination.enteredActivityType=activityType
            destination.enteredDuration=duration
            destination.enteredCalories=calories
            destination.result=totalCaloriesBurned
            destination.resultImgName=imageName
            
            
        }
    }
    
    
}

