//
//  ViewController.swift
//  ClimateApp
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
        //Read the temperature
        var temp = inputOL.text!
        
        //Convert String to Int/Double
        var input = Int(temp)!
        //Check whether it is cold or hot
        
        //temperature>60 (hot) otherwise, cold
        //Display the appropriate image
        if (input>60)
        {
            //assign the result to the output label
            imageOL.image = UIImage(named: "hotday")
            outputOL.text = "It is a hot day! 🙂🔥 "
        }
        else
        {
            imageOL.image = UIImage(named: "coldday")
            outputOL.text = "It is a cold day! 🥶🤧"
        }
    }
    
}

