//
//  ViewController.swift
//  colorChange
//
//  Created by Andraz Kuret on 28. 10. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    
    @IBOutlet weak var display: UIView!
    @IBOutlet weak var redControl: UISwitch!
    @IBOutlet weak var greenControl: UISwitch!
    @IBOutlet weak var blueControl: UISwitch!

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let redDefault : CGFloat = CGFloat(redSlider.value)
        let greenDefault : CGFloat = CGFloat(greenSlider.value)
        let blueDefault : CGFloat = CGFloat(blueSlider.value)
        
        redSlider.minimumTrackTintColor = UIColor(red: redDefault, green: 0, blue: 0, alpha: 1)
        greenSlider.minimumTrackTintColor = UIColor(red: 0, green: greenDefault, blue: 0, alpha: 1)
        blueSlider.minimumTrackTintColor = UIColor(red: 0, green: 0, blue: blueDefault, alpha: 1)
        
        display.layer.borderWidth = 5
        display.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).CGColor
        
        display.backgroundColor = UIColor(red: redDefault, green: greenDefault, blue: blueDefault, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeBacgroundColorOfDisplay(sender: AnyObject) {
        let r : CGFloat = self.redControl.on ? 1 : 0
        let g : CGFloat = self.greenControl.on ? 1 : 0
        let b : CGFloat = self.blueControl.on ? 1 : 0
        
        display.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    @IBAction func changeBacgroundColorWithSlider(sender: AnyObject) {
        let r : CGFloat = CGFloat(self.redSlider.value)
        let g : CGFloat = CGFloat(greenSlider.value)
        let b : CGFloat = CGFloat(blueSlider.value)
        
        display.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        redSlider.minimumTrackTintColor = UIColor(red: r, green: 0, blue: 0, alpha: 1)
        greenSlider.minimumTrackTintColor = UIColor(red: 0, green: g, blue: 0, alpha: 1)
        blueSlider.minimumTrackTintColor = UIColor(red: 0, green: 0, blue: b, alpha: 1)
    }
    
    

}

