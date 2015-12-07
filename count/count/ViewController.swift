//
//  ViewController.swift
//  count
//
//  Created by Andraz Kuret on 27. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bg: UIView!
    @IBAction func click(sender: UIButton) {
        increment()
        changeBgColorOnEveryClick()
        display.textColor = UIColor.whiteColor()
    }
    @IBAction func decri(sender: UIButton) {
        decrement()
        bg.backgroundColor = UIColor.whiteColor()
        display.textColor = UIColor.blackColor()
    }
    @IBOutlet weak var display: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.text = "0"
    }
    
    func increment() {
        count++
        display.text = "\(count)"
    }

    func decrement() {
        count--
        display.text = "\(count)"
    }
    
    func changeBgColorOnEveryClick() {
        bg.backgroundColor = UIColor.blueColor()
    }

}

