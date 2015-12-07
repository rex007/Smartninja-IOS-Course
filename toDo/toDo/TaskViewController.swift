//
//  TaskViewController.swift
//  toDo
//
//  Created by Andraz Kuret on 2. 12. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit


class TaskViewController: UIViewController {
    
    var currentTask : Task?
    let fontSize : CGFloat = 20.0
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentTask == nil {
            currentTask = Task(name: "First task", priority: 2)
            currentTask?.note = "Task note"
        }
        
        if let task = currentTask{
            let formatedString = NSMutableAttributedString()
            
            formatedString.appendAttributedString(NSAttributedString(string: "Name: ", attributes: [ NSFontAttributeName: UIFont(name: "Lato-Regular", size: fontSize)!]))
            formatedString.appendAttributedString(NSAttributedString(string: "\(task.name)\n", attributes: [ NSFontAttributeName: UIFont(name: "Lato-Bold", size: fontSize)!]))
            
            
            formatedString.appendAttributedString(NSAttributedString(string: "Priority: ", attributes: [ NSFontAttributeName: UIFont(name: "Lato-Regular", size: fontSize)!]))
            formatedString.appendAttributedString(NSAttributedString(string: String(task.priority), attributes: [ NSFontAttributeName: UIFont(name: "Lato-Bold", size: fontSize)!]))
            
            
            if let note = task.note{
                formatedString.appendAttributedString(NSAttributedString(string: "\nNote:\n", attributes: [ NSFontAttributeName: UIFont(name: "Lato-Regular", size: fontSize)!]))
                formatedString.appendAttributedString(NSAttributedString(string: note, attributes: [ NSFontAttributeName: UIFont(name: "Lato-Bold", size: fontSize)!]))
            }
            
            descriptionLabel.attributedText = formatedString
        }
    }
    
}