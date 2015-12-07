//
//  DisplayMsgcontroller.swift
//  messageSender
//
//  Created by Andraz Kuret on 5. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class DisplayMsgController: UIViewController {
    @IBOutlet weak var displayMsg: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textMessage:", name: "TextMessage", object: nil)
        
    }
    
    func textMessage(notification: NSNotification){
        if let text = notification.object as? String {
            displayMsg.text = text
        }
    }
    
}