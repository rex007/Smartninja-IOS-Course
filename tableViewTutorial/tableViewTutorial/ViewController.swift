//
//  ViewController.swift
//  tableViewTutorial
//
//  Created by Andraz Kuret on 23. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let zaposleniKeli = ["CEO": "Goran Spes","Programer": "Andraz Kuret","Janitor": "Denis Rozina","Assistant": "Davor Moskun","Employee": "Gregor Svara"]
    
    let cellViewName = "cellView"
    var workStar = [String]()


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zaposleniKeli.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // hide all detailTextLabel cells
        for cell in tableView.visibleCells {
            cell.detailTextLabel?.hidden = true
        }
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.detailTextLabel?.hidden = false
        
        //  show current cell detailTextLabel
        let indexPath = tableView.indexPathForSelectedRow!
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let showValueFromKeys = currentCell.textLabel!.text

        currentCell.detailTextLabel?.text = zaposleniKeli[showValueFromKeys!]!
        
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellViewName, forIndexPath: indexPath) as UITableViewCell
        
        for(workersRate,_) in zaposleniKeli{
            workStar.append(workersRate)
        }
        
        cell.textLabel?.text = workStar[indexPath.row]
        cell.detailTextLabel!.text = ""
        
        return cell
    }


}

