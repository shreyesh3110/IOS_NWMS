//
//  ViewController.swift
//  Chennagouni_WordGuess
//
//  Created by Shreyesh Chennagouni on 3/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    
    @IBOutlet weak var totalWordsLabel: UILabel!
    
    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var guessLetterField: UITextField!
    
    @IBOutlet weak var GuessLetter: UIButton!
    
    
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var guessCountLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    
    @IBOutlet weak var displayImage: UIImageView!
    
    var words = [
        (word: "Chennagouni", hint: "Shreyesh", image: UIImage(named: "nwmsu")),
        (word: "Swift", hint: "Programming language", image: UIImage(named: "swift")),
        (word: "Dog", hint: "A pet", image: UIImage(named: "dog")),
        (word: "Macbook", hint: "Apple Laptop", image: UIImage(named: "macbook")),
        (word: "Pizza", hint: "Food starts with P", image: UIImage(named: "pizza"))
    ];
    
    var currentWordIndex = 0 // Track current word index
    var count = 0
    var word = ""
    var lettersGuessed = ""
    var wrongGuessCount = 0
    let maxNumOfWrongGuesses = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordsGuessedLabel.text = "Total number of words guessed successfully :  \(currentWordIndex)"
        wordsRemainingLabel.text = "Total number of words remaining in game : \(words.count - currentWordIndex)"
        totalWordsLabel.text = "Total number of Words in game : \(words.count)"
        
        userGuessLabel.text="_ _ _ _ _ _ _ _ _ _ _"
        
        hintLabel.text = "Hint: \(words[currentWordIndex].hint)"
        
    }

    func setupGame() {
        
        if currentWordIndex >= words.count {
                    // If all words have been guessed
                    statusLabel.text = "Congratulations! You've guessed all the words!"
                    currentWordIndex = 0 // Restart the game from the first word
                }
                let currentWord = words[currentWordIndex].word.uppercased() // Get the current word
                lettersGuessed = "" // Reset guessed letters
                updateUnderscores(for: currentWord) // Display underscores for the word
        //the hint label must display the next hint when they pressed play again button

            hintLabel.text = "Hint: \(words[currentWordIndex].hint)"
        
        //hintLabel.text = "Hint: \(words[currentWordIndex].hint)" // Set the hint
                statusLabel.text = "" // Clear the status
                wrongGuessCount = 0 // Reset wrong guesses
                guessCountLabel.text = "You have made  \(wrongGuessCount) guesses"
                updateWordsLabels() // Update word count labels
                //displayImage.image = nil // Reset image display
        //GuessLetter.isEnabled = false
    }
    
    // Update underscores for word display
        func updateUnderscores(for word: String) {
            var displayText = ""
            for _ in word {
                displayText += "_ " // Display underscores for each letter
            }
            userGuessLabel.text = displayText
        }
    
    // Update the guessed and remaining words count
    func updateWordsLabels() {
        wordsGuessedLabel.text = "Total number of words guessed successfully :  \(currentWordIndex)"
        wordsRemainingLabel.text = "Total number of words remaining in game : \(words.count - currentWordIndex)"
        totalWordsLabel.text = "Total number of Words in game : \(words.count)"
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        
        guard let letter = guessLetterField.text?.trimmingCharacters(in: .whitespacesAndNewlines).uppercased(), !letter.isEmpty else { return }

                guessLetterField.text = "" // Clear the input field
                //GuessLetter.isEnabled = false // Disable the guess button
                
                lettersGuessed += letter // Append guessed letter
                let currentWord = words[currentWordIndex].word.uppercased()
                var revealedLetters = ""

                for l in currentWord {
                    if lettersGuessed.contains(l) {
                        revealedLetters += "\(l) "
                        statusLabel.text = "Good guess! Keep going."
                    } else {
                        revealedLetters += "_ "

                    }
                }
        //displayImage.image = words[currentWordIndex].image

                userGuessLabel.text = revealedLetters // Update word display
                
                if !revealedLetters.contains("_") {
                    // Word is fully guessed
                    statusLabel.text = "Good job! You guessed the word!"
                    GuessLetter.isEnabled = false
                    playAgain.isEnabled = true
                    updateWordsLabels()
                    moveToNextWord() // Automatically move to the next word after a correct guess
                } else {
                    // Increment wrong guess count
                    wrongGuessCount += 1
                    guessCountLabel.text = "You have made  \(wrongGuessCount) guesses"
                    updateWordsLabels()
                    if wrongGuessCount == maxNumOfWrongGuesses {
                        statusLabel.text = "You have used all the available guesses, Please play again"
                        GuessLetter.isEnabled = false // Disable further guesses
                        playAgain.isEnabled = true
                        updateWordsLabels()
                    }
                }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        GuessLetter.isEnabled = true
        playAgain.isEnabled = false
        setupGame() // Reset game for the current word
    }
    
    func moveToNextWord() {
        
        displayImage.image = words[currentWordIndex].image

           currentWordIndex += 1
           if currentWordIndex < words.count {
               setupGame() // Set up the next word
           } else {
               statusLabel.text = "Congratulations! You've guessed all the words!"
               displayImage.image = UIImage(named: "welldone")
               currentWordIndex = 0 // Reset to the first word when all words are guessed
           }
        updateWordsLabels()
       }
    
    
    @IBAction func guessFieldChanged(_ sender: UITextField) {
        let textEntered = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        GuessLetter.isEnabled = !textEntered.isEmpty
        // Enable Guess button if valid character is entered
    }
    
}

