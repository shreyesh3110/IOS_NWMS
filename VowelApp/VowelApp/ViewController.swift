//
//  ViewController.swift
//  VowelApp
//
//  Created by Shreyesh Chennagouni on 1/28/25.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var inputOL: UITextField!
    
    
    @IBOutlet weak var outputOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtn(_ sender: Any) {
        var input = inputOL.text!
        
        if(input.contains("a") || input.contains("e") || input.contains("i") || input.contains("o") || input.contains("u") || input.contains("A") || input.contains("E") || input.contains("I") || input.contains("O") || input.contains("U"))
        {
            outputOL.text = "Entered text contains vowels"
        }
        else{
            outputOL.text = "Entered text has no vowels"
        }
        
    }
    

}

