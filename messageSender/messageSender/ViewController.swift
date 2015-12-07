//
//  ViewController.swift
//  messageSender
//
//  Created by Andraz Kuret on 4. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for ViewController in (self.tabBarController?.viewControllers)!{
            ViewController.loadViewIfNeeded()
        }
        
        
    }

    @IBAction func sendMsg() {
        NSNotificationCenter.defaultCenter().postNotificationName("TextMessage", object: messageView.text!)
        messageView.resignFirstResponder()
    }
    
    
}

