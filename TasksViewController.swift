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
        
        tasksTV.dataSource = self
        tasksTV.delegate = self
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        getTask()
        tasksTV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important == true {
        cell.textLabel?.text = "\(task.name!)      👹💣"
        //cell.backgroundColor = UIColor.purple
        // Encontrar como cambiar el fuenta a blanca....
        }
        
        if task.important == false {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "ShowTaskSegue", sender: task)
    }
    
    

    @IBAction func Addbtn(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTask() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        
        } catch {
            
            print("Bad thingy in the request catch")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task

        }
        
        
    }
    

}
