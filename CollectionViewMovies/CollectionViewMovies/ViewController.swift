//
//  ViewController.swift
//  CollectionViewMovies
//
//  Created by Shreyesh Chennagouni on 4/10/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //create a cell
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        //populate the cell with movie images
        cell.assignMovie(with: movies[indexPath.row])
        //return the call
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        TitleOL.text="Movie Title: \(movies[indexPath.row].title)"
        YearOL.text="Year: \(movies[indexPath.row].releasedYear)"
        RatingOL.text="Rating: \(movies[indexPath.row].movieRating)"
        RevenueOL.text="Revenue: \(movies[indexPath.row].boxOffice)"
        
    }
    

    
    @IBOutlet weak var TitleOL: UILabel!
    
    @IBOutlet weak var YearOL: UILabel!
    
    @IBOutlet weak var RatingOL: UILabel!
    
    @IBOutlet weak var RevenueOL: UILabel!
    
    @IBOutlet weak var CollectionViewOL: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CollectionViewOL.delegate = self
        CollectionViewOL.dataSource = self
    }


}

