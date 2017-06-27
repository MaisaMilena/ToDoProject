//
//  AtividadeList.swift
//  ToDoProject
//
//  Created by Maisa Milena on 26/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//
import RealmSwift
import Realm


class AtividadeList: Object {
    
    var id = ""
    var nome = ""
    let itens = List<Atividade>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
