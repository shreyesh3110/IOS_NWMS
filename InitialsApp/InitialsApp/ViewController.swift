//
//  ViewController.swift
//  InitialsApp
//
//  Created by Shreyesh Chennagouni on 1/30/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var fnameOL: UITextField!
    
    @IBOutlet weak var lnameOL: UITextField!
    
    @IBOutlet weak var outputOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtn(_ sender: Any) {
        //Read the first name and store it in a variable
        var fname = fnameOL.text!
        //Read the last name and store it in a variable
        var lname = lnameOL.text!
        
        //Read the first letter of first name and first letter of last name and string interpolate both the letters
        let fnameChar = fname.prefix(1).uppercased()
        let lnameChar = lname.prefix(1).uppercased()
        //Display the ressult in the outputOL
        outputOL.text = "Initials: \(fnameChar).\(lnameChar)."
    }
    
}

