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
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var dataLimite: UIDatePicker!
    
    @IBOutlet weak var atualizarButton: UIButton!
    
    var id: Int = 0
    var atividade = Atividade()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizarButton.layer.cornerRadius = atualizarButton.frame.height/2
        
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
        let realm = try! Realm()
        if id != 0 {
            try! realm.write {
                let predicate: NSPredicate = NSPredicate(format: "id == \(self.id)", argumentArray: nil)
                atividade = realm.objects(Atividade.self).filter(predicate).first!
            }
        }
    }
    
    @IBAction func atualizarAtividade(_ sender: Any) {

        let realm = try! Realm()
        try! realm.write {
            atividade.nome = nome.text!
            atividade.descricao = descricao.text!
            atividade.dataLimite = dataLimite.date
        }
        performSegue(withIdentifier: "configuracaoListarSegue", sender: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let proximaTela = segue.destination as! ListarTableViewController
    }
    

}
