//
//  ToDoDetailViewModel.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 2.10.2023.
//

import Foundation

class ToDoDetailViewModel {
    var krepo = ToDosDaoRepository()
    
    func update(todo_id: Int,todo_title: String, todo_text: String){
        krepo.update(todo_id: todo_id, todo_title: todo_title, todo_text: todo_text)
    }
}
