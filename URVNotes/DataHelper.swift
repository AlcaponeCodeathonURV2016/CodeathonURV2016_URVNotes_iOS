//
//  DataHelper.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import RealmSwift

class DataHelper {
    
    
    
    static func seed(){
        let realm = try! Realm()
        
        let grau = Grau(value: ["nom":"Grau d'Enginyeria Informàtica"])
        
        let assignatura1 = Assignatura(value: ["nom": "Estructures de Dades", "grau":grau])
        grau.assignatures.append(assignatura1)
        
        let assignatura2 = Assignatura(value: ["nom": "Bases de Dades", "grau":grau])
        grau.assignatures.append(assignatura2)
        
        let assignatura3 = Assignatura(value: ["nom": "Fonaments de Sistemes Operatius", "grau":grau])
        grau.assignatures.append(assignatura3)
        
        let assignatura4 = Assignatura(value: ["nom": "Matemàtica Discreta II", "grau":grau])
        grau.assignatures.append(assignatura4)
        let assignatura5 = Assignatura(value: ["nom": "Estructura de Computadors", "grau":grau])
        grau.assignatures.append(assignatura5)
        
        let usuari = Usuari(value: ["nom":"NomTEST", "cognoms":"CognokmTEST", "email":"exampletest@gmail.com"])
        usuari.graus.append(grau)
        
        try! realm.write {
            realm.add(usuari)
            realm.add(grau)
            realm.add(assignatura1)
            realm.add(assignatura2)
            realm.add(assignatura3)
            realm.add(assignatura4)
            realm.add(assignatura5)
        }
    }

}
