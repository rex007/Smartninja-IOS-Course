//
//  senderModel.swift
//  messageSender
//
//  Created by Andraz Kuret on 5. 11. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class senderModel: NSObject {

    let date =  NSDate()
    var messageBox: String = "Ti wo"
    
    
    func sendMessage(message: String) {
        messageBox = message
        print(messageBox)
    }
    
    
    func formatDate(date: NSDate)-> String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm"
        formatter.timeZone = NSTimeZone(name: "UTC")
        return formatter.stringFromDate(date)
    }
}