//
//  ToDos.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 1.10.2023.
//

import Foundation

class ToDos {
    var todo_id: Int?
    var todo_title: String?
    var todo_text: String?
    
    init(){
        
    }
    
    init(todo_id: Int, todo_title: String, todo_text: String) {
        self.todo_id = todo_id
        self.todo_title = todo_title
        self.todo_text = todo_text
    }
}
