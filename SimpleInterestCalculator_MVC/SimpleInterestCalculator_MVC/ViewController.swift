//
//  ViewController.swift
//  SimpleInterestCalculator_MVC
//
//  Created by Sai Rama Raju Puram on 3/27/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var principalOL: UITextField!
    
    @IBOutlet weak var rateOL: UITextField!
 
    @IBOutlet weak var timeOL: UITextField!
    
    var principal=0
    var rate=0
    var time=0
    var category=""
    var result=0.0
    var imgName=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBtn(_ sender: UIButton) {
        principal=Int(principalOL.text!)!
        rate=Int(rateOL.text!)!
        time=Int(timeOL.text!)!
        
        result=Double(principal)*(Double(rate)/100)*Double(time)
        
        if result<100
        {
            category="Low"
            imgName="low"
        }
        else if result>=100 && result<500
        {
            category="Medium"
            imgName="medium"
        }
        else
        {
            category="High"
            imgName="high"
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var transition=segue.identifier
        if transition == "ResultSegue"
        {
            var destination=segue.destination as! ResultViewController
            destination.enteredPrincipal=principal
            destination.enteredRate=rate
            destination.enteredTime=time
            destination.categoryMessage=category
            destination.mainResult=result
            destination.resultImgName=imgName
        }
        
    }
    
}

