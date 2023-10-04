//
//  ToDoSave.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 2.10.2023.
//

import UIKit

class ToDoSave: UIViewController {
    
    @IBOutlet weak var tfToDoTitle: UITextField!
    @IBOutlet weak var tfToDoText: UITextField!
    
    var viewModel = ToDoSaveViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let tdTitle = tfToDoTitle.text, let tdText = tfToDoText.text {
            viewModel.save(todo_title: tdTitle, todo_text: tdText)
        }
    }
}
