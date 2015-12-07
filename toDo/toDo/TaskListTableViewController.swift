//
//  TaskListTableViewController.swift
//  toDo
//
//  Created by Andraz Kuret on 3. 12. 15.
//  Copyright © 2015 Andraz Kuret. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    let acquireColor = UIColor(red: 0.66, green: 1.00, blue: 0.83, alpha: 1.0)
    let closedColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.0)
    let agreementColor = UIColor(red: 0.97, green: 0.84, blue: 0.96, alpha: 1.0)
    let noresponseColor = UIColor(red: 0.78, green: 0.80, blue: 0.88, alpha: 1)

    var tasks: [Task] = [Task]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loadTaks()
        
        tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)
        
        let task = tasks[indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = "Priority: \(task.priority)"
        
        changeCellDependOnStatus(task, cell: cell)
        
        // gesture recognizer
        
        if cell.gestureRecognizers == nil || cell.gestureRecognizers?.count == 0{
            let recognizer = UILongPressGestureRecognizer(target: self, action: "deleteTask:")
            recognizer.minimumPressDuration = 2.0
            
            cell.addGestureRecognizer(recognizer)
        }

        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        let task = tasks[indexPath.row]
        
        if task.status == .Closed{
            return false
        }else{
            return true
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let task = tasks[indexPath.row]
        
        let acquiree = UITableViewRowAction(style: .Normal, title: "Acquiree", handler: {  action,indexPath in task.status = .Acquiree
        
            TaskManager.shared.save()
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
        
        let agreement = UITableViewRowAction(style: .Normal, title: "Agreement", handler: { action,indexPath in task.status = .Agreement
        
            TaskManager.shared.save()
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
        
        let noresponse = UITableViewRowAction(style: .Normal, title: "NoResp", handler: { action,indexPath in task.status = .NoResponse
        
            TaskManager.shared.save()
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
        
        let resolved = UITableViewRowAction(style: .Normal, title: "Resolved", handler: { action,indexPath in task.status = .Resolved
            
            TaskManager.shared.save()
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
        })
        
        let close = UITableViewRowAction(style: .Normal, title: "Closed", handler: { action, indexPath in task.status = .Closed
            
            TaskManager.shared.save()
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        })
        
        acquiree.backgroundColor = acquireColor
        agreement.backgroundColor = agreementColor
        noresponse.backgroundColor = noresponseColor
        resolved.backgroundColor = UIColor.greenColor()
        close.backgroundColor = UIColor.grayColor()
        
        
        
        switch task.status{
        case .Acquiree:
            return [resolved, agreement, noresponse]
        case .Resolved:
            return [close]
        case .Agreement:
            return [resolved, acquiree]
        case .NoResponse:
            return [resolved,agreement]
        default:
            return [acquiree]
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let taskSegueViewController = segue.destinationViewController as? TaskViewController{
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
            
            taskSegueViewController.currentTask = tasks[indexPath!.row]
        }
    }
    
    private func loadTaks() {
        
        tasks.removeAll()
        
        let allTasks = TaskManager.shared.allTasks
        
        for task in allTasks {
            tasks.append(task)
        }
    
    }
    
    func deleteTask(recognizer: UIGestureRecognizer) {
        if let cell = recognizer.view as? UITableViewCell {
            let indexPath = tableView.indexPathForCell(cell)!
            let task = tasks[indexPath.row]
            
            let alertController = UIAlertController(title: task.name, message: "Select your action:", preferredStyle: .ActionSheet)
            alertController.addAction(UIAlertAction(title: "delete", style: .Destructive , handler: { action in
            
                if let tasks = TaskManager.shared.tasks{
                    let index = tasks.indexOf({ $0 === task})
                    
                    var mutableTask = tasks
                    mutableTask.removeAtIndex(index!)
                    
                    TaskManager.shared.tasks = mutableTask
                    TaskManager.shared.save()
                    
                    self.loadTaks()
                    self.tableView.reloadData()
                }
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    func changeCellDependOnStatus(task: Task, cell: UITableViewCell) {
        switch task.status{
        case .Acquiree:
            cell.accessoryType = .DisclosureIndicator
            cell.backgroundColor = acquireColor
        case .Closed:
            cell.accessoryType = .Checkmark
            cell.backgroundColor = closedColor
            cell.textLabel?.alpha = 0.5
            cell.detailTextLabel?.alpha = 0.5
        case .Agreement:
            cell.accessoryType = .DisclosureIndicator
            cell.backgroundColor = agreementColor
        case .Resolved:
            cell.accessoryType = .DisclosureIndicator
            cell.backgroundColor = UIColor.greenColor()
        case .NoResponse:
            cell.accessoryType = .DisclosureIndicator
            cell.backgroundColor = noresponseColor
        default:
            cell.accessoryType = .DisclosureIndicator
            cell.backgroundColor = UIColor(red: 182.0, green: 207.0, blue: 245.0, alpha: 1.0)
            cell.textLabel?.alpha = 1
            cell.detailTextLabel?.alpha = 1
            
        }
    }
    
}