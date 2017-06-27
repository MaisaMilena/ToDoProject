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
    var notificationToken: NotificationToken!
    var realm: Realm!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupRealm()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atividades.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = atividades[indexPath.row]
        cell.textLabel?.text = item.nome
        return cell
    }
    
    func setupRealm() {
        // Log in existing user with username and password
        let username = "test"  // <--- Update this
        let password = "test"  // <--- Update this
        
        SyncUser.logIn(with: .usernamePassword(username: username, password: password, register: false), server: URL(string: "http://127.0.0.1:9080")!) { user, error in
            guard let user = user else {
                fatalError(String(describing: error))
            }
            
            DispatchQueue.main.async {
                // Open Realm
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://127.0.0.1:9080/~/realmtasks")!)
                )
                self.realm = try! Realm(configuration: configuration)
                
                // Show initial tasks
                func updateList(){
                    if self.atividades.realm == nil, let list = self.realm.objects(AtividadeList.self).first {
                        self.atividades = list.itens
                    }
                    self.tableView.reloadData()
                }
                updateList()
                            
                // Notify us when Realm changes
                self.notificationToken = self.realm.addNotificationBlock { _ in
                    updateList()
                }
            }
        }
    }
    
    deinit {
        notificationToken.stop()
    }
    
    

}

