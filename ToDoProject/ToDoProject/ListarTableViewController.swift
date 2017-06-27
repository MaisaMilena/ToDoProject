//
//  ListarTableViewController.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import RealmSwift

class ListarTableViewController: UITableViewController {

    var atividades = List<Atividade>()
    let realm = try! Realm()
    var toDoList: Results<Atividade>{
        get {
            return realm.objects(Atividade.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        toDoList = Results<Atividade>{
//            {
//                get {
//                    return realm.objects(Atividade.self)
//                }
//            }
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = toDoList[indexPath.row]
        cell.textLabel?.text = item.nome
        return cell
    }
 
    
    

}

