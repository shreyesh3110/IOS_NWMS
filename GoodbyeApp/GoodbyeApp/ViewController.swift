//
//  ViewController.swift
//  GoodbyeApp
//
//  Created by Shreyesh Chennagouni on 1/21/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameOL: UITextField!
    
    
    @IBOutlet weak var fnameOL: UITextField!
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func submitBtn(_ sender: Any) {
        var name = nameOL.text!
        var fname = fnameOL.text!
        
        label.text = "GoodBye, \(fname) \(name)!"
    }
    
}

