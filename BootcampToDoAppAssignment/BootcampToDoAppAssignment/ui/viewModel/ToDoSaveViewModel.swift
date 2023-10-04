//
//  ToDoSaveViewModel.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 2.10.2023.
//

import Foundation

class ToDoSaveViewModel {
    var krepo = ToDosDaoRepository()
    
    func save(todo_title: String, todo_text: String) {
        krepo.save(todo_title: todo_title, todo_text: todo_text)
    }
}
