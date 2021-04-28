//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Lizzie Ferguson on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    var task: Task?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        
    }
    
    @IBAction func savButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextView.text, !notes.isEmpty else {return}
        
        if let task = task {
            task.name = name
            task.notes = notes
            task.dueDate = taskDueDatePicker.date
            
            TaskController.sharedInstance.upDateTask(task: task, name: name, notes: notes, dueDate: taskDueDatePicker.date)
        }else{
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: taskDueDatePicker.date)
        }
        navigationController?.popViewController(animated: true)
    }
    func updateView() {
        
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        if let dueDate = task.dueDate {
            taskDueDatePicker.date = dueDate
        }
        
    }
}


