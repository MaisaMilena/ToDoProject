//
//  Atividade.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import RealmSwift
import Realm


class Atividade: Object {
    
    var id = ""
    var nome = ""
    var descricao = ""
  
    override static func primaryKey() -> String? {
        return "id"
    }
     
}
