//
//  ViewController.swift
//  TabelViewDemo
//
//  Created by Shreyesh Chennagouni on 4/8/25.
//

import UIKit

class Product{
    var productName:String
    var ProductDescription:String
    
    init(prodName:String, prodDesc:String)
    {
        self.productName=prodName
        self.ProductDescription=prodDesc
    }
}
//
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return productarray count
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell
        let cell = TabelViewOL.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        //populate the cell
        cell.textLabel?.text=productArray[indexPath.row].productName
        
        //return the call
        return cell
    }
    
    
    @IBOutlet weak var TabelViewOL: UITableView!
    
    var productArray=[Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TabelViewOL.dataSource=self
        TabelViewOL.delegate=self
        
        let prod1=Product(prodName: "iPhone 13", prodDesc: "This is a new iPhone 13")
        productArray.append(prod1)
        let prod2=Product(prodName: "MacBook Pro", prodDesc: "This is a new MacBook Pro")
        productArray.append(prod2)
        let prod3=Product(prodName: "AirPods Pro", prodDesc: "This is a new AirPods Pro")
        productArray.append(prod3)
        let prod4=Product(prodName: "iMac", prodDesc: "This is a new iMac")
        productArray.append(prod4)
        let prod5=Product(prodName: "Apple Watch Series 7", prodDesc: "This is a new Apple Watch Series 7")
        productArray.append(prod5)
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transitiom=segue.identifier
        if transitiom=="ProductSegue"{
            let destination = segue.destination as! ResultViewController
            destination.product=productArray[(TabelViewOL.indexPathForSelectedRow?.row)!]
        }
    }

}

