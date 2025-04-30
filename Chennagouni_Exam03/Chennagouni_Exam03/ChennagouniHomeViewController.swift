//
//  ViewController.swift
//  Chennagouni_Exam03
//
//  Created by Shreyesh Chennagouni on 4/22/25.
//

import UIKit

class ChennagouniHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var ChennagouniTVOL: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Games"
        ChennagouniTVOL.delegate = self
        ChennagouniTVOL.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return games.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChennagouniCell", for: indexPath)
            cell.textLabel?.text = games[indexPath.row].name
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "ChennagouniDescriptionSegue", sender: indexPath)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ChennagouniDescriptionSegue",
               let destinationVC = segue.destination as? ChennagouniGameController,
               let indexPath = sender as? IndexPath {
                destinationVC.selectedGame = games[indexPath.row]
            }
        }
}


