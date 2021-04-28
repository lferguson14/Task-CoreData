//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Lizzie Ferguson on 4/27/21.
//

import CoreData

class TaskController {
    
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    
    private lazy var fetchRequest : NSFetchRequest<Task> = {
        
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() { }
    
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name)
        tasks.append(task)
        CoreDataStack.saveContext()
    }
    func fetchTask() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(tasks.count)
        self.tasks = tasks
        }
        
    func upDateTask(task: Task, name: String, notes: String?, dueDate: Date?) {
        CoreDataStack.saveContext()
        }
        
        
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        CoreDataStack.saveContext()
        }
    }

