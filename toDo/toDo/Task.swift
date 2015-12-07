//
//  Task.swift
//  toDo
//
//  Created by Andraz Kuret on 1. 12. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import Foundation

class Task {

    var name: String
    var addDate: NSDate = NSDate()
    var dateModified: NSDate = NSDate()
    var priority: UInt
    var note: String?
    var status: Status = .Adopted
    
    init (name: String, priority: UInt = 0){
        self.name = name
        self.priority = priority
    }
    
    init (dictionary: [String: AnyObject]) {
        self.name = dictionary["name"] as! String
        self.priority = dictionary["priority"] as! UInt
        self.addDate = dictionary["added"] as! NSDate
        self.dateModified = dictionary["modified"] as! NSDate
        self.status = Status(rawValue: (dictionary["status"] as! UInt))!
        
        if let note = dictionary["note"] as? String {
            self.note = note
        }
    }
    
    func description() -> String {
        return ("Task: \(name), status: \(status)")
    }
    
    func toDictionary() -> [String: AnyObject] {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd MM YYYY"
        
        var data = ["name" : self.name, "modified" : self.dateModified, "added" : self.addDate, "priority" : self.priority,"status" : self.status.rawValue ]
        
        if self.note != nil {
            data["note"] = self.note!
        }
        
        return data
    }
    
}