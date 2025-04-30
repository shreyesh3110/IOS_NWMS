//
//  ResultViewController.swift
//  Chennagouni_Exam02
//
//  Created by Shreyesh Chennagouni on 4/1/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var enteredActivityTypeOL: UILabel!
    
    @IBOutlet weak var enteredDurationOL: UILabel!
    
    @IBOutlet weak var enteredCaloriesOL: UILabel!
    
    @IBOutlet weak var resultLabelOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var enteredActivityType=""
    var enteredDuration=0.0
    var enteredCalories=0.0
    var result=0.0
    var resultImgName=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        enteredActivityTypeOL.text=enteredActivityTypeOL.text!+"  "+enteredActivityType
        enteredDurationOL.text=enteredDurationOL.text!+" "+String(enteredDuration)
        enteredCaloriesOL.text=enteredCaloriesOL.text!+" "+String(enteredCalories)
        resultLabelOL.text=resultLabelOL.text!+" "+String(result)
        imageOL.image=UIImage(named: resultImgName)
        
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
