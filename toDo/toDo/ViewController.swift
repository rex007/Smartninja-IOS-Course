//
//  ViewController.swift
//  toDo
//
//  Created by Andraz Kuret on 1. 12. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UITextFieldDelegate, ImageViewControllerDelegate {
    
    let manager = TaskManager.shared

    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var priorityNumber: UILabel!
    @IBOutlet weak var prioritySlider: UISlider!
    @IBOutlet weak var messageLabelView: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        messageLabelView.text = ""
        
        priorityNumber.layer.borderColor = UIColor.blackColor().CGColor
        priorityNumber.layer.borderWidth = 1.0
        priorityNumber.text = "1"
        
        nameTextView.delegate = self
        
        if let taskName = NSUserDefaults.standardUserDefaults().objectForKey("TaskName") as? String {
            nameTextView.text = taskName
        }
    }
    
//    deinit{
//        NSUserDefaults.standardUserDefaults().removeObjectForKey("TaskName")
//        NSUserDefaults.standardUserDefaults().removeObjectForKey("AllTasks")
//    }
    
    @IBAction func slideValueChanged(sender: UISlider) {
        var currentValue = UInt(sender.value)
        priorityNumber.text = "\(currentValue)"
    }

    @IBAction func addButton(sender: UIButton) {
        guard let name = nameTextView.text where !name.isEmpty else{
            messageLabelView.text = "Name can't be blank!"
            messageLabelView.textColor = UIColor.redColor()
            
            var center = nameTextView.center
            center.x = self.view.center.x
            
            var leftCenter = center
            leftCenter.x -= 8
            
            var rightCenter = center
            rightCenter.x += 6
            
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            
            UIView.animateWithDuration(0.1, animations: {
                    self.nameTextView.center = leftCenter
                }, completion: { success in
                    UIView.animateWithDuration(0.1, animations: {
                            self.nameTextView.center = rightCenter
                        }, completion: { success2 in
                            UIView.animateWithDuration(0.1, animations: {
                                self.nameTextView.center = center
                            })
                    })
            })
            
            
        return
        }
        
        let task = Task(name: name, priority: UInt(prioritySlider.value))
        
        if !notesTextView.text.isEmpty {
            task.note = notesTextView.text
        }
        
        var taskAlredyExist: Bool = false
        
        for i in manager.allTasks {
            if name == i.name {
                taskAlredyExist = true
            }
        }
        
        if taskAlredyExist {
            
            messageLabelView.text = "You alredy have the same task in database!"
            messageLabelView.textColor = UIColor.redColor()
            
        }else{
            
            if !notesTextView.text.isEmpty{
                task.note = notesTextView.text
            }
            
            manager.addTask(task)
            
            messageLabelView.text = "There are \(manager.allTasks.count ) tasks in database!"
            messageLabelView.textColor = UIColor.blackColor()
            
            TaskManager.shared.save()
            

            UIView.animateWithDuration(0.2, animations: { () -> Void in
               sender.transform = CGAffineTransformMakeScale(0.90, 0.90)
            }){ success in
                UIView.animateWithDuration(0.2){
                    sender.transform = CGAffineTransformIdentity
                }
            }
        }

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddImageSegue" {
            let viewController = segue.destinationViewController as! ImageViewController
            viewController.delegate = self
        }
    }
    
    

    

    func imageViewControllerDidFinish(imageViewController: ImageViewController) {
        imageViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

