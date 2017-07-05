//
//  CreateTaskViewController.swift
//  JustDoIt2.0
//
//  Created by JoseLuis Lara VIllanueva on 7/4/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTF: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addMeBtn(_ sender: Any) {
        //Create a task with outlet info 
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = taskNameTF.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
     
        //Popo Back

        navigationController!.popViewController(animated: true)
 
    }



}
