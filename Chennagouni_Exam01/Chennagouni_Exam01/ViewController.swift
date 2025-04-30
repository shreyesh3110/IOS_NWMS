//
//  ViewController.swift
//  Chennagouni_Exam01
//
//  Created by Shreyesh Chennagouni on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input1OL: UITextField!
    
    @IBOutlet weak var input2OL: UITextField!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    
    @IBOutlet weak var outputOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkBtn(_ sender: Any) {

        let input1 = input1OL.text ?? ""  // Updated name
        let input2 = input2OL.text ?? ""  // Updated name
                
                if input1.isEmpty || input2.isEmpty {
                    outputOL.text = "Please enter the input values for PM2.5 and PM10."
                    imageOL.image = nil
                    return
                }
                
                if let pm25 = Double(input1), let pm10 = Double(input2) {
                    let aqc = (pm25 + pm10) / 2
                    let roundedAQC = String(format: "%.1f", aqc)
                    var category = ""
                    var imageName = ""
                    var emoji=""
                    
                    if aqc < 50 {
                        category = "best👍"
                        imageName = "Best"
                        emoji=""
                    } else if aqc >= 50 && aqc < 100 {
                        category = "moderate"
                        imageName = "Moderate"
                        emoji="😕"
                    } else {
                        category = "poor"
                        imageName = "Poor"
                        emoji="🥲"
                    }
                    
                    outputOL.text = "The AQC value is \(roundedAQC).\nThis is considered to be \(category) quality air \(emoji)."
                    imageOL.image = UIImage(named: imageName)
                } else {
                    outputOL.text = "Please enter valid numeric values for PM2.5 and PM10."
                    imageOL.image = nil
                }
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        input1OL.text=""
        input2OL.text=""
        outputOL.text=""
        imageOL.image=nil
        
    }
    
    
}

