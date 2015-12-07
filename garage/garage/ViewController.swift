//
//  ViewController.swift
//  garage
//
//  Created by Andraz Kuret on 16. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var cars: [Car]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cars = [Car(brand: "Honda", model: "Civic", yearBoth: 1997),Car(brand: "Fiat", model: "Stilo", yearBoth: 1994),Car(brand: "Hyundai", model: "Getz", yearBoth: 2004)]
        
        self.tableView.dataSource = self
        
        }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cars = cars{
            return cars.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIndent", forIndexPath: indexPath) as UITableViewCell
        
        let car = cars![indexPath.row]
        
        cell.textLabel?.text = car.brand
        
        return cell
        
    }


}

