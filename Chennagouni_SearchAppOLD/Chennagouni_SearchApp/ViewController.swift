//
//  ViewController.swift
//  Chennagouni_SearchApp
//
//  Created by Shreyesh Chennagouni on 3/31/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var topicInfoText: UITextView!
    
    @IBOutlet weak var searchButtonAction: UIButton!
    
    @IBOutlet weak var ShowPrevImageBtn: UIButton!
    
    @IBOutlet weak var ResetBtn: UIButton!
    
    @IBOutlet weak var ShowNextImageBtn: UIButton!
    
    var topics: [String: [[String: String]]] = [
        
        "Famous Landmarks": [
            ["keywords": "places", "image": "eiffeltower", "description": "The Eiffel Tower is a globally recognized symbol of Paris and France, offering stunning panoramic views."],
            ["keywords": "places", "image": "mountrushmore", "description": "The Statue of Liberty represents freedom and democracy, standing tall in New York Harbor."],
            ["keywords": "places", "image": "pyramids", "description": "The Taj Mahal is a stunning white marble mausoleum, renowned as a symbol of love and an architectural masterpiece."]
        ],
        "Space Exploration": [
            ["keywords": "space", "image": "marsrover", "description": "NASA's robotic rover that explores the surface of Mars for signs of past life."],
            ["keywords": "space", "image": "rocketlanding", "description": "The Hubble Space Telescope captures stunning images of distant galaxies and nebulae."],
            ["keywords": "space", "image": "moonlanding", "description": "The historic Apollo missions that landed humans on the Moon, starting with Apollo 11 in 1969."]
        ],
        "Wildlife": [
            ["keywords": "animals", "image": "elephant", "description": "The Bengal tiger is a majestic predator native to the forests of India and Bangladesh."],
            ["keywords": "animals", "image": "deer", "description": "The giant panda is a beloved bear native to China, known for its distinctive black-and-white fur."],
            ["keywords": "animals", "image": "cheetah", "description": "The eagle is a powerful bird of prey, known for its keen eyesight and impressive flight skills."]
        ],
        "Festivals": [
            ["keywords": "event", "image": "vinayakachavithi", "description": "Diwali is the Festival of Lights, celebrated by Hindus around the world with fireworks, sweets, and prayers."],
            ["keywords": "event", "image": "christmas", "description": "Christmas is a Christian holiday celebrating the birth of Jesus Christ, marked by decorations, gifts, and family gatherings."],
            ["keywords": "event", "image": "onam", "description": "Carnival is a vibrant and colorful festival celebrated with parades, dancing, and music, especially in Brazil."]
        ],
        "Inventions": [
            ["keywords": "tech", "image": "lightbulb", "description": "The light bulb revolutionized indoor lighting, invented by Thomas Edison and others in the late 19th century."],
            ["keywords": "tech", "image": "telephone", "description": "The telephone, invented by Alexander Graham Bell, revolutionized communication across long distances."],
            ["keywords": "tech", "image": "aeroplane", "description": "The airplane, invented by the Wright brothers, revolutionized travel and transportation across the globe."]
        ]
    ]
    
    var currentTopic: String?
    var currentImageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultImage.image = UIImage(named: "welcome")
        topicInfoText.text = "Hello, Yesh!!"
        searchButtonAction.isEnabled = false
        ShowPrevImageBtn.isEnabled = false
        ShowNextImageBtn.isEnabled = false
        searchTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @objc func textFieldChanged() {
        searchButtonAction.isEnabled = !(searchTextField.text?.isEmpty ?? true)
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
        playSound(1113)
        let searchText = searchTextField.text?.lowercased() ?? ""
        
        for (topic, images) in topics {
            if images.contains(where: { $0["keywords"] == searchText }) {
                currentTopic = topic
                currentImageIndex = 0
                updateImageAndText()
                return
            }
        }
        resultImage.image = UIImage(named: "search_not_found")
        topicInfoText.text = "No result found for '\(searchText)'"
        ShowNextImageBtn.isEnabled = false
        ShowPrevImageBtn.isEnabled = false
    }
    
    @IBAction func prevBtn(_ sender: UIButton) {
        playSound(1105)
        if let topic = currentTopic, currentImageIndex > 0 {
            currentImageIndex -= 1
            updateImageAndText()
        }
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        playSound(1105)
        if let topic = currentTopic, currentImageIndex < (topics[topic]!.count - 1) {
            currentImageIndex += 1
            updateImageAndText()
        }
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        playSound(1111)
        currentTopic = nil
        currentImageIndex = 0
        searchTextField.text = ""
        resultImage.image = UIImage(named: "welcome")
        topicInfoText.text = "Hello, Yesh!!"
        ShowNextImageBtn.isEnabled = false
        ShowPrevImageBtn.isEnabled = false
    }
    func updateImageAndText() {
        if let topic = currentTopic {
            let imageData = topics[topic]![currentImageIndex]
            resultImage.image = UIImage(named: imageData["image"]!)
            topicInfoText.text = imageData["description"]
            updateButtons()
        }
    }
    
    func updateButtons() {
        if let topic = currentTopic {
            ShowPrevImageBtn.isEnabled = currentImageIndex > 0
            ShowNextImageBtn.isEnabled = currentImageIndex < (topics[topic]!.count - 1)
        }
    }
    func playSound(_ soundID: SystemSoundID) {
        AudioServicesPlaySystemSound(soundID)
    }
}
