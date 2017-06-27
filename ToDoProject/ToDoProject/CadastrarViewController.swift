//
//  CadastrarViewController.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import RealmSwift
import Realm


class CadastrarViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var dataLimite: UIDatePicker!
    
    var atividades = List<Atividade>()
    var notificationToken: NotificationToken!
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRealm()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
            }
        }
    }
    
    deinit {
        notificationToken.stop()
    }
    
    
    
    
    
    @IBAction func cadastrarAtividade(_ sender: Any) {
        //atividades.append(Atividade(value: ["nome": nome.text]))
        
        try! atividades.realm?.write {
            atividades.insert(Atividade(value: ["nome": nome.text]), at: atividades.filter("concluido = false").count)
        }
        performSegue(withIdentifier: "cadastrarListarSegue", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listar = segue.destination as! ListarTableViewController
        listar.atividades = self.atividades
    }
    

}
