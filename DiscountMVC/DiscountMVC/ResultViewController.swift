//
//  ResultViewController.swift
//  DiscountMVC
//
//  Created by Shreyesh Chennagouni on 3/20/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var enteredAmountOL: UILabel!
    
    @IBOutlet weak var enteredDiscountOL: UILabel!
    
    @IBOutlet weak var priceAfterDiscountOL: UILabel!
    
    
    var amount=""
    var discount=""
    var priceAfterDiscount=""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                enteredAmountOL.text = "Entered amount: \(amount)"
                enteredDiscountOL.text = "Discount: \(discount)"
                priceAfterDiscountOL.text = "Price After Discount: \(priceAfterDiscount)"
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
