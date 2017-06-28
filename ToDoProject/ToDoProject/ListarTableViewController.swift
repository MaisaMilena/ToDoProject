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
    var idAtividade: Int = 0
    
    
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
        
        let idAtividade = cell.viewWithTag(1) as! UILabel
        idAtividade.text = String(item.id)
        return cell
    }
 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
     Deleta um determinado item do banco e da table view
     */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let atividade = toDoList[indexPath.row]
            try! self.realm.write ({
                self.realm.delete(atividade)
            })
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = toDoList[indexPath.row]   
        idAtividade = item.id
        performSegue(withIdentifier: "listarConfiguracaoSegue", sender: indexPath.row)
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let proximaTela = segue.destination as! ConfiguracoesViewController
        proximaTela.id = idAtividade
    }
}

