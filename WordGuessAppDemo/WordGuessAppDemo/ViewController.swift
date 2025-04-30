//
//  ViewController.swift
//  WordGuessAppDemo
//
//  Created by Shreyesh Chennagouni on 2/13/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayOL: UILabel!
    
    @IBOutlet weak var hintOL: UILabel!
    
    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var checkOL: UIButton!
    
    @IBOutlet weak var messageOL: UILabel!
    
    @IBOutlet weak var playagainOL: UIButton!
    
    var words = [["SWIFT", "Programming Language"],
                 ["DOG", "Animal"],
                 ["CYCLE", "Two wheeler"],
                 ["MACBOOK", "Apple device"]]
        
        var count = 0;
        var word = ""
        var lettersGuessed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Check button is disabled at first.
        checkOL.isEnabled = false;
                //First word from the array is stored in variable
                word = words[count][0]
                
        displayOL.text = ""
                
                //Insert the display label with underscores. The count of underscores is equal to the count of characters in the word.
                updateUnderscores();
                
                //Get the first hint from the array
        hintOL.text = "Hint: "+words[count][1]
                
                //Clear the status label intially.
        messageOL.text = ""
    }
    
    
    @IBAction func checkBtnClick(_ sender: UIButton) {
        //Get the text from the text field.
                let letter = inputOL.text!
        
        //Replace the guessed letter if the letter is part of the word.
                lettersGuessed = lettersGuessed + letter
                 var revealedWord = ""
                for l in word{
                    if lettersGuessed.contains(l){
                        revealedWord += "\(l)"
                    }
                    else{
                        revealedWord += "_ "
                    }
                }
        
        //Assigning the word to diplayOL after a guess
        displayOL.text = revealedWord
                inputOL.text = ""
                
                //If the word is guessed correctly, we are enabling play again button and disabling the check button.
                if displayOL.text!.contains("_") == false{
                    playagainOL.isHidden = false;
                    checkOL.isEnabled = false;
                }
        checkOL.isEnabled = false
    }
    
    
    @IBAction func playAgainBtnClick(_ sender: UIButton) {
        //Reset the button to disable initially.
        playagainOL.isHidden = true
                //clear the label
                lettersGuessed = ""
                count += 1
                //if count reaches the end of the array (all the words are guessed sucessfully), then print Congratualtions in the status label.
                if count == words.count{
                    
                    messageOL.text = "Congruations! You are done with the game!"
                    //clearing the labels.
                    displayOL.text = ""
                    hintOL.text = ""
                }
                else{
                    //fetch the next word from the array
                    word = words[count][0]
                    //fetch the hint related to the word
                    hintOL.text = "Hint: "
                    hintOL.text! += words[count][1]
                    //Enabling the check button.
                    checkOL.isEnabled = true
                    
                    displayOL.text = ""
                    updateUnderscores()
                }
    }
    
    
    @IBAction func letterEntered(_ sender: UITextField) {
        //Read the data from the text field
        var textEnterd = inputOL.text!;
                //Consider only the last character by calling textEntered.last and trimming the white spaces.
                textEnterd = String(textEnterd.last ?? " ").trimmingCharacters(in: .whitespaces)
        inputOL.text = textEnterd
                
                //Check whether the entered text is empty or not to enable check button.
                if textEnterd.isEmpty{
                    checkOL.isEnabled = false
                }
                else{
                    checkOL.isEnabled = true
                }
                
    }
    
    func updateUnderscores(){
            for letter in word{
                displayOL.text! += "_ "
            }
        }
}

