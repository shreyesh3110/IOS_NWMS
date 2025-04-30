//
//  ViewController.swift
//  VoterApp
//
//  Created by Shreyesh Chennagouni on 1/23/25.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    @IBOutlet weak var outputOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func submitBtn(_ sender: Any) {
        var input = inputOL.text!
        var age = Int(input)!
        
        if(age<18)
        {
            imageOL.image = UIImage(named:"noteligible")
            outputOL.text = "You are not Eligible to Vote!🥲"
        }
        else
        {
            imageOL.image = UIImage(named:"eligible")
            outputOL.text = "You are Eligible to vote!🥳"
        }
    }
    
}

