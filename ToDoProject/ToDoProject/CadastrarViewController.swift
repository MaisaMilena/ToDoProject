//
//  CadastrarViewController.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import RealmSwift

class CadastrarViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var dataLimite: UIDatePicker!
    
    @IBOutlet weak var cadastrarButton: UIButton!
    
    
    var atividades = List<Atividade>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cadastrarButton.layer.cornerRadius = cadastrarButton.frame.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func cadastrarAtividade(_ sender: Any) {
        
        let realm = try! Realm()
        // Adiciona a atividade
        
        let newId = { () -> Int in
            if realm.objects(Atividade.self).first != nil {
                return (realm.objects(Atividade.self).last?.id)! + 1 //pega o próximo id disponivel
            } else {
                return 1
            }   
        }
        
        // Cria uma atividade
        let atividade = Atividade()
        atividade.id = newId()
        atividade.nome = nome.text!
        atividade.descricao = descricao.text
        atividade.dataLimite = dataLimite.date
        
        
        try! realm.write {
            realm.add(atividade)
        }
        
        // Muda de tela
        performSegue(withIdentifier: "cadastrarListarSegue", sender: nil)
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listar = segue.destination as! ListarTableViewController
        listar.atividades = self.atividades
    }
    

}
