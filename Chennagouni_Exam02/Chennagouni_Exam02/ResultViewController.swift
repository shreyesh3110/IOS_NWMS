//
//  ResultViewController.swift
//  Chennagouni_Exam02
//
//  Created by Shreyesh Chennagouni on 4/3/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var enteredGoalTypeOL: UILabel!
    
    @IBOutlet weak var enteredTargetAmountOL: UILabel!
    
    @IBOutlet weak var enteredRateOL: UILabel!
    
    @IBOutlet weak var resultOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var enteredGoalType=""
    var enteredTargetAmount=0.0
    var enteredRate=0.0
    var result=0.0
    var resultImgName=""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        enteredGoalTypeOL.text=enteredGoalTypeOL.text!+" "+enteredGoalType
        enteredTargetAmountOL.text=enteredTargetAmountOL.text!+" "+String(enteredTargetAmount)
        enteredRateOL.text=enteredRateOL.text!+" "+String(enteredRate)
        resultOL.text=resultOL.text!+" "+String(result)
        imageOL.image=UIImage(named: resultImgName)
        
        imageOL.alpha = 0.0
        UIView.animate(withDuration: 1.5) {
            self.imageOL.alpha = 1.0
        }
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
