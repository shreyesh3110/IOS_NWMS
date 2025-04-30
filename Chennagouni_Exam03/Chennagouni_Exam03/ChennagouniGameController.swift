//
//  ChennagouniGameController.swift
//  Chennagouni_Exam03
//
//  Created by Shreyesh Chennagouni on 4/22/25.
//

import UIKit

class ChennagouniGameController: UIViewController {
    
    var selectedGame: Game?
    
    @IBOutlet weak var imageViewOL: UIImageView!
    
    @IBOutlet weak var nameOL: UILabel!
    

    @IBOutlet weak var descriptionOL: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedGame?.name
                nameOL.text = selectedGame?.name
                descriptionOL.text = selectedGame?.information
                imageViewOL.image = selectedGame?.imageName
                animateImage()
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    func animateImage() {
           imageViewOL.alpha = 0.0
           UIView.animate(withDuration: 1.5) {
               self.imageViewOL.alpha = 1.0
           }
       }
}
