//
//  Atividade.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import RealmSwift
import Foundation

class Atividade: Object {
    
    dynamic var id = 0
    dynamic var nome = ""
    dynamic var descricao = ""
    dynamic var dataLimite = Date()
    dynamic var concluido = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
