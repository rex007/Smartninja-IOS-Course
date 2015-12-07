//
//  ViewController.swift
//  myGarage
//
//  Created by Andraz Kuret on 16. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController : UITableViewController {
    
    var cars: [Car]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.tableView.delegate = self
        cars = [ Car(brand: "Fiat", model: "Punto", topSpeed: 50.0), Car(brand: "Honda", model: "Civic", topSpeed: 240.70), Car(brand: "Skoda", model: "Octavia", topSpeed: 140.00)]
        
      
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let cars = cars{
            return cars.count
        }
        
        return 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        let car = cars![indexPath.row]
        
        
        cell.textLabel?.text = car.brand
        cell.detailTextLabel?.text = car.model
        
        
        
        return cell
        
    }



}

