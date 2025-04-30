//
//  ViewController.swift
//  HelloApp
//
//  Created by Shreyesh Chennagouni on 1/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var displayOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func submitBtnClicked(_ sender: Any) {
        
        var name = inputOL.text!
        
        displayOL.text = "Hello,\(name)!"
        
    }
    
}

