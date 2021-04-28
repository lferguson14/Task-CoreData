//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Lizzie Ferguson on 4/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}
class TaskTableViewCell: UITableViewCell {

 
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    weak var delegate: TaskCompletionDelegate?
    
    var task: Task? {
        didSet {
            updateViews()
        }
        
    }
    
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        delegate?.taskCellButtonTapped(self)
        
    }
    
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        if task.isComplete {
        completionButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            completionButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
        
    }
  
    
}


