//
//  ViewController.swift
//  smartNinja-converter
//
//  Created by Andraz Kuret on 26. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let usdRate = 1.14
    let jpyRate = 136.12
    
    var currentCurrency = Currency(type: "USD", rate: 1.14)
    var converter = Converter()

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var jpyButton: UIButton!
    @IBOutlet weak var resultText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usdButton.selected = true
        
    }

    @IBAction func usdTap(sender: UIButton) {
        currentCurrency = Currency(type: "USD", rate: usdRate)
        usdButton.selected = true
        jpyButton.selected = false
    }
    @IBAction func jpyTap(sender: UIButton) {
        currentCurrency = Currency(type: "JPY", rate: jpyRate)
        jpyButton.selected = true
        usdButton.selected = false
    }
    @IBAction func convertCurrency(sender: UIButton) {
        if let value = Double(textField.text!){
            let (converted,_) = converter.convert(value, startCurrency: Currency(), targetCurrency: currentCurrency)
            resultText.text = "In \(currentCurrency.type): \(converted)"
            resultText.textColor = UIColor.blackColor()
        }
        else{
            resultText.text = "Invalid Number!"
            resultText.textColor = UIColor.redColor()
        }
    }
}

