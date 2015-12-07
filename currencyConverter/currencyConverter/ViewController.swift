//
//  ViewController.swift
//  currencyConverter
//
//  Created by Andraz Kuret on 19. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UIPickerViewDelegate {
    var pickerData: [String] = [String]()
    var defaultValue: String = "EUR"
    var buttonTitle: String = ""
    let converter = Converter()
    
    
    let EurRates = (usd: 1.13, jpy: 135.29)
    let UsdRates = (eur: 0.88, jpy: 119.38)
    let JpyRates : Double = 0.01
    var rate: Double = 0.01
    
    @IBOutlet weak var firstCurrency: UIPickerView!
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var rateText: UITextField!
    
    @IBAction func currencySelector(sender: UIButton) {
        convertAndDisplay(sender.currentTitle!)
    }

    
    @IBOutlet weak var resultToDisplay: UILabel!
    @IBAction func clear(sender: UIButton) {
        numberInput.text = "0"
        resultToDisplay.text = "0"
        resultToDisplay.textColor = UIColor.blackColor()
        rateText.text = ""
    }
    
    override func viewDidLoad() {
        
        pickerData = ["EUR","USD","JPY"]
        initKeyBoardOnlyNum()



        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func initKeyBoardOnlyNum() {
        numberInput.text = "0"
        numberInput.keyboardType = UIKeyboardType.DecimalPad
        numberInput.clearsOnInsertion = true
    }
    

    func selectRate(firstCurrency: String,secondCurrency: String) {
        switch(firstCurrency){
        case("EUR"):
            if secondCurrency == "USD" { rate = EurRates.usd }
            else { rate = EurRates.jpy }
        case("USD"):
            if secondCurrency == "EUR" { rate = UsdRates.eur }
            else { rate = UsdRates.jpy }
        default:
            rate = JpyRates
        }
        buttonTitle = secondCurrency
    }
    
    func convertAndDisplay(currentTitle: String) {
        if let stringToNumber = Double(numberInput.text!){
            selectRate(defaultValue, secondCurrency: currentTitle)
            if defaultValue != currentTitle {
                let  result = converter.convert(stringToNumber, startCurrency: "\(defaultValue)", targetCurrency: rate)
                resultToDisplay.text = "\(result.convertedValue) " + currentTitle
                resultToDisplay.textColor = UIColor.blackColor()
                rateText.text = "Menjalni tečaj: 1 \(defaultValue) = \(rate) \(buttonTitle)"
            }
            else{
                resultToDisplay.text = "Can't convert same currency"
                resultToDisplay.textColor = UIColor.redColor()
                rateText.text = ""
            }
        }
        else {
            resultToDisplay.text = "Invalid number!"
            resultToDisplay.textColor = UIColor.redColor()
        }
    }

    
//    init pickerView
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent compunent: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaultValue = pickerData[row]
    }

}

