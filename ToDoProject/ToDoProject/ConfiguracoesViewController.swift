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
    
    var id: String!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func carregarAtividade(){
        
        var atividade = Atividade()
        
        try! realm.write {
            let predicate: NSPredicate = NSPredicate(format: "id = \(self.id)", argumentArray: nil)
            atividade = realm.objects(Atividade.self).filter(predicate).first!
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
