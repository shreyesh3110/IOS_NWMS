//
//  ResultViewController.swift
//  Bmi_mvc
//
//  Created by Shreyesh Chennagouni on 3/25/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var enteredHfeetOL: UILabel!
    
    @IBOutlet weak var enteredHinchesOL: UILabel!
    
    @IBOutlet weak var enteredWlbsOL: UILabel!
    
    @IBOutlet weak var resultLabelOL: UILabel!
    
    @IBOutlet weak var imageViewOL: UIImageView!
    
    var enteredHfeet=0
    var enteredHinches=0
    var enteredWlbs=0.0
    var bmiResult=0.0
    var bmiImageName=""
    var healthMessage=""
    var categoryMessage=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enteredHfeetOL.text=enteredHfeetOL.text!+String(enteredHfeet)
        enteredHinchesOL.text=enteredHinchesOL.text!+String(enteredHinches)
        enteredWlbsOL.text=enteredWlbsOL.text!+String(enteredWlbs)
        
        resultLabelOL.text="""
BMI value: \(bmiResult)
Category: \(categoryMessage)
Health Tip: \(healthMessage)
""" C
        
        imageViewOL.image=UIImage(named: bmiImageName)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
