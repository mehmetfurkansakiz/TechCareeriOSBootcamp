//
//  ToDosDaoRepository.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 1.10.2023.
//

import Foundation
import RxSwift

class ToDosDaoRepository {
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func save(todo_title: String, todo_text: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO todos (todo_title, todo_text) VALUES (?,?)", values: [todo_title, todo_text])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func update(todo_id: Int,todo_title: String, todo_text: String){
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE todos SET todo_title=?, todo_text=? WHERE todo_id=?", values: [todo_title, todo_text, todo_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func search(searchText: String) {
        db?.open()
        
        var list = [ToDos]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM todos WHERE todo_title like '%\(searchText)%'", values: nil)
            
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id")!)
                let todo_title = rs.string(forColumn: "todo_title")!
                let todo_text = rs.string(forColumn: "todo_text")!
                
                let todo = ToDos(todo_id: todo_id!, todo_title: todo_title, todo_text: todo_text)
                list.append(todo)
            }
            
            toDoList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func delete(todo_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM todos WHERE todo_id=?", values: [todo_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func uploadToDo() {
        db?.open()
        
        var list = [ToDos]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM todos", values: nil)
            
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id")!)
                let todo_title = rs.string(forColumn: "todo_title")!
                let todo_text = rs.string(forColumn: "todo_text")!
                
                let todo = ToDos(todo_id: todo_id!, todo_title: todo_title, todo_text: todo_text)
                list.append(todo)
            }
            toDoList.onNext(list)
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func copyDatabase(){
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{} }
    }
}
