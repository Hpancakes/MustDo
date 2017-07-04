//
//  TasksViewController.swift
//  JustDoIt2.0
//
//  Created by JoseLuis Lara VIllanueva on 7/3/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tasksTV: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()

        tasksTV.dataSource = self
        tasksTV.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important == true {
        cell.textLabel?.text = "\(task.name)    💣"
        }
        
        if task.important == false {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Go to antos house"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy cake for antos house"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Go for the Desktop"
        task3.important = true
        
        return [task1, task2, task1]
    }

    @IBAction func Addbtn(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    

}
