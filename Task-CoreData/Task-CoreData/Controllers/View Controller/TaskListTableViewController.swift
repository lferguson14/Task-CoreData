//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by Lizzie Ferguson on 4/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TaskController.sharedInstance.fetchTask()
      
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as? TaskTableViewCell else {return UITableViewCell()}
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        cell.task = task
        cell.delegate = self

        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
 
 */

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailController" {
            guard let destinationVC = segue.destination as? TaskDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = task
            
        }

 }
}

extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else {return}
        TaskController.sharedInstance.toggleIsComplete(task: task)
        sender.updateViews()
    }
    
    
    
}

