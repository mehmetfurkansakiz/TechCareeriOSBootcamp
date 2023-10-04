//
//  ToDoViewModel.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 2.10.2023.
//

import Foundation
import RxSwift

class ToDoViewModel {
    
    var krepo = ToDosDaoRepository()
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    init() {
        krepo.copyDatabase()
        toDoList = krepo.toDoList
    }
    
    func search(searchText: String) {
        krepo.search(searchText: searchText)
    }
    
    func delete(todo_id: Int) {
        krepo.delete(todo_id: todo_id)
        uploadToDo()
    }
    
    func uploadToDo() {
        krepo.uploadToDo()
    }
}
