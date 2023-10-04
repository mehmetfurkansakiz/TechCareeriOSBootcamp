//
//  ToDoDetail.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 2.10.2023.
//

import UIKit

class ToDoDetail: UIViewController {
    
    @IBOutlet weak var tfToDoTitle: UITextField!
    @IBOutlet weak var tfToDoText: UITextField!
    
    var todo: ToDos?
    var viewModel = ToDoDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tD = todo {
            tfToDoTitle.text = tD.todo_title
            tfToDoText.text = tD.todo_text
        }
        
    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        if let tdTitle = tfToDoTitle.text, let tdText = tfToDoText.text, let tD = todo{
            viewModel.update(todo_id: tD.todo_id!, todo_title: tdTitle, todo_text: tdText)
        }
    }
}
