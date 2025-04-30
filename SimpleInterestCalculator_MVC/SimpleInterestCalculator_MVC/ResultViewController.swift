//
//  ResultViewController.swift
//  SimpleInterestCalculator_MVC
//
//  Created by Sai Rama Raju Pruam on 3/27/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var enteredPrincipalOL: UILabel!
    
    @IBOutlet weak var enteredRateOL: UILabel!
    
    @IBOutlet weak var enteredTimeOL: UILabel!
    
    @IBOutlet weak var resultLabelOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var enteredPrincipal=0
    var enteredRate=0
    var enteredTime=0
    var mainResult=0.0
    var categoryMessage=""
    var resultImgName=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        enteredPrincipalOL.text=enteredPrincipalOL.text!+String(enteredPrincipal)
        enteredRateOL.text=enteredRateOL.text!+String(enteredRate)
        enteredTimeOL.text=enteredTimeOL.text!+String(enteredTime)
        resultLabelOL.text="""
Simple Interest:\(mainResult)
Category: \(categoryMessage)
"""
        imageOL.image=UIImage(named: resultImgName)
        
        animateImage()
    }
    
    
    func animateImage() {
        imageOL.alpha = 0.0 // Start invisible
        imageOL.transform = CGAffineTransform(scaleX: 0.5, y: 0.5) // Start small
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.imageOL.alpha = 1.0 // Fade in
            self.imageOL.transform = .identity // Bounce to normal size
        }, completion: nil)
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
