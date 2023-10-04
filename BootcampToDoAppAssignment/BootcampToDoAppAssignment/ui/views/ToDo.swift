//
//  ViewController.swift
//  BootcampToDoAppAssignment
//
//  Created by furkan sakız on 1.10.2023.
//

import UIKit
import RxSwift

class ToDo: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var toDoList = [ToDos]()
    var viewModel = ToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        _ = viewModel.toDoList.subscribe(onNext: { list in
            self.toDoList = list
            self.toDoTableView.reloadData()
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadToDo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let todo = sender as? ToDos {
                let destinationVC = segue.destination as! ToDoDetail
                destinationVC.todo = todo
            }
        }
    }

}

extension ToDo : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

extension ToDo: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoTableViewCell
        
        let todo = toDoList[indexPath.row]
        
        cell.labelToDoTitle.text = todo.todo_title
        cell.labelToDoText.text = todo.todo_text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDoList[indexPath.row]
        
        performSegue(withIdentifier: "toDetailVC", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let todo = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete ToDo", message: "Are you sure want to delete \(todo.todo_title!)?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.viewModel.delete(todo_id: todo.todo_id!)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

