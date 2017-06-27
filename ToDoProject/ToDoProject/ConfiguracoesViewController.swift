//
//  ConfiguracoesViewController.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import RealmSwift

class ConfiguracoesViewController: UIViewController {

    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var dataLimite: UIDatePicker!
    
    
    var id: String!
    let realm = try! Realm()
    var atividade = Atividade()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apresentaAtividade()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func apresentaAtividade(){
        // Carrega os dados daquela atividade
        carregarAtividade()
        
        // Configura para apresentar na tela
        nome.text = atividade.nome
        descricao.text = atividade.descricao
        dataLimite.date = atividade.dataLimite
    }
    
    private func carregarAtividade(){
    
        try! realm.write {
            let predicate: NSPredicate = NSPredicate(format: "id = \(self.id)", argumentArray: nil)
            atividade = realm.objects(Atividade.self).filter(predicate).first!
        }
        
    }
    
    @IBAction func atualizarAtividade(_ sender: Any) {
        
        atividade.nome = nome.text!
        atividade.descricao = descricao.text!
        atividade.dataLimite = dataLimite.date
        
        try! realm.write {
            atividade = realm.create(Atividade.self,
                                     value: ["id": atividade.id,
                                            "nome": atividade.nome,
                                             "descricao": atividade.descricao,
                                             "dataLimite": atividade.dataLimite],
                                     update: true)
        }
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
