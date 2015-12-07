//
//  ViewController.swift
//  Calculator2
//
//  Created by Andraz Kuret on 2. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!

    var userInTheMiddleOfTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var stack: [Double] = []
    
    @IBAction func enter() {
        stack.append(displayValue)
        userInTheMiddleOfTyping = false
        print(stack)
    }


    @IBAction func clear() {
        stack.removeAll()
        display.text = "0"
        print(stack)
    }
    @IBAction func appendDigit(sender: UIButton) {
        var digit = sender.currentTitle!
        if userInTheMiddleOfTyping {
            display.text = display.text! + digit
        }else{
            display.text = digit
            userInTheMiddleOfTyping = true
        }
    }
    @IBAction func operand(sender: UIButton) {
        switch sender.currentTitle!{
            case "x": calculate{$0 * $1}
            case "/": calculate{$0 / $1}
            case "+": calculate{$0 + $1}
            case "-": calculate{$0 - $1}
            default: "Error, wrong value"
        }
    }
    
    func calculate(operation: (Double,Double) -> Double) {
        if stack.count >= 2 {
            displayValue = operation(stack.removeLast(),stack.removeLast())
            enter()
        }
    }
    
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userInTheMiddleOfTyping = false
        }
    }

}

