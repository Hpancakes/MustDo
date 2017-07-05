//
//  CompleteTaskViewController.swift
//  JustDoIt2.0
//
//  Created by JoseLuis Lara VIllanueva on 7/4/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var tasLbl: UILabel!
    
    var task = Task()
    var  previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        if task.important == true {
            tasLbl.text = "\(task.name)    💣"
        }
        
        if task.important == false {
            tasLbl.text = task.name
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func completedBtn(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tasksTV.reloadData()
        navigationController!.popViewController(animated: true)
    }


}
