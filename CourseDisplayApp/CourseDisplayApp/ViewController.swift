//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by Shreyesh Chennagouni on 2/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewOL: UIImageView!
    
    @IBOutlet weak var crsNumOL: UILabel!
    
    @IBOutlet weak var crsTitleOL: UILabel!
    
    @IBOutlet weak var semOfferedOL: UILabel!
    
    @IBOutlet weak var prevBtnOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    
    var imageIndex = 0
    
    let courses = [["img01","44555","Network Security","Fall 2024"],
                   ["img02","44643","Mobile Computing","Summer 2023"],
                   ["img03","44222","Data Streaming","Spring 2025"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Update the course details (image,crsNUm, title, sem offered)  with the first element in the array.
        //Update the course details
        imageViewOL.image = UIImage(named: courses[imageIndex][0])
        crsNumOL.text = courses[imageIndex][1]
        crsTitleOL.text = courses[imageIndex][2]
        semOfferedOL.text = courses[imageIndex][3]
        
        //next button is enabled
        nextBtnOL.isEnabled = true
        
        //prev button is disabled
        prevBtnOL.isEnabled = false
    }

    @IBAction func prevBtnClicked(_ sender: UIButton) {
        //decrement the image
        imageIndex -= 1
        
        //Update the course details
        imageViewOL.image = UIImage(named: courses[0][0])
        crsNumOL.text = courses[0][1]
        crsTitleOL.text = courses[0][2]
        semOfferedOL.text = courses[0][3]
        
        //previous button is enabled
        nextBtnOL.isEnabled = true
        
        //Check if the element is at the end of the array, and next button should be disabled.
        if(imageIndex == 0)
        {
            prevBtnOL.isEnabled = false
        }
        
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        //increment the image
        imageIndex += 1
        
        //Update the course details
        imageViewOL.image = UIImage(named: courses[imageIndex][0])
        crsNumOL.text = courses[imageIndex][1]
        crsTitleOL.text = courses[imageIndex][2]
        semOfferedOL.text = courses[imageIndex][3]
        
        //previous button is enabled
        prevBtnOL.isEnabled = true
        
        //Check if the element is at the end of the array, and next button should be disabled.
        if(imageIndex == courses.count-1)
        {
            nextBtnOL.isEnabled = false
        }
        
    }
    
    func updateCourseDetails(_ imageindex:Int){
        imageViewOL.image = UIImage(named: courses[imageIndex][0])
        crsNumOL.text = courses[imageIndex][1]
        crsTitleOL.text = courses[imageIndex][2]
        semOfferedOL.text = courses[imageIndex][3]
        
    }
    
}

