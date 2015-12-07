//
//  ViewController.swift
//  countdown
//
//  Created by Andraz Kuret on 15. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textDisplay: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    
    
    var currentTime = 0.0
    
    var appered = false
    
    let systemSoundID: SystemSoundID = 1003
    
    var timer: NSTimer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        appered = true
    }
    
    deinit{
        cleanUpTimer()
    }
    
    

    @IBAction func startStop(sender: UIButton) {
        if timer != nil {
            
            cleanUpTimer()
            
            sender.setTitle("Start", forState: .Normal)
            startButton.backgroundColor = UIColor.greenColor()
        }else{
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
            
            sender.setTitle("Stop", forState: .Normal)
            startButton.backgroundColor = UIColor.redColor()
            
            currentTime = 30.0
            
            updateTimer()
        }
    }

    
    
    @IBAction func addBtn(sender: UIButton) {
        currentTime += 10.0
        
        updateTimer()
        
    }
    
    
        
    func updateTimer() {
        if !appered{
            return
        }
        
        currentTime = currentTime - 1.0
            
        if currentTime < 0{
            currentTime = 0
        }
            
        // Calculate minutes and seconds
            
        let minutes = UInt(floor(currentTime) / 60 )
        let seconds = UInt(currentTime - Double(minutes) * 60)
            
        textDisplay.text = NSString(format: "%02d:%02d", minutes,seconds) as String
        
        if currentTime < 10.0 {
            textDisplay.textColor = UIColor.orangeColor()
            
        }else{
            textDisplay.textColor = UIColor.blackColor()
        }
        
        if currentTime == 0{
            startButton.setTitle("Start", forState: .Normal)
            textDisplay.textColor = UIColor.redColor()
            
            cleanUpTimer()
            
            AudioServicesPlayAlertSound(systemSoundID)
            
            UIView.animateWithDuration(0.38, animations: {
                    self.textDisplay.transform = CGAffineTransformMakeScale(1.3, 1.3)
                }, completion: { success in UIView.animateWithDuration(0.38, animations: {
                        self.textDisplay.transform = CGAffineTransformIdentity
                    }, completion: nil)
            })
        }
    }
    
    func cleanUpTimer(){
        if let timer = timer{
            timer.invalidate()
            self.timer = nil
        }
    }
}

