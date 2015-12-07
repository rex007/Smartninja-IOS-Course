//
//  TaskManager.swift
//  toDo
//
//  Created by Andraz Kuret on 1. 12. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import Foundation

class TaskManager: NSObject {
    static let shared = TaskManager()
    
    var tasks: [Task]?
    
    var allTasks: [Task]{
        if tasks == nil{
            loadAllTasks()
        }
        
        return tasks!
    }
    
    func addTask(task: Task){
        if tasks == nil{
            loadAllTasks()
        }
        tasks!.append(task)
        
        NSNotificationCenter.defaultCenter().postNotificationName("NewTask", object: task)
    }
    
    func save() {
        guard let tasks = tasks else{
            return
        }
        
        var serializedTasks = [AnyObject]()
        
        for task in tasks {
            serializedTasks.append(task.toDictionary())
        }
        
        NSUserDefaults.standardUserDefaults().setObject(serializedTasks, forKey: "AllTasks")
        NSUserDefaults.standardUserDefaults().synchronize()
    
    }
    
    func loadAllTasks() {
        self.tasks = loadTasks()
    }
    
    func loadTasks() -> [Task]{
        let serializedTasks = NSUserDefaults.standardUserDefaults().objectForKey("AllTasks")
        
        var tasks = [Task]()
        
        if let serializedTasks = serializedTasks as? [[String : AnyObject]] {
            for task in serializedTasks {
                let newTask = Task(dictionary: task)
                
                tasks.append(newTask)
            }
        }
        return tasks
    }
}