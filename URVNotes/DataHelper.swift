//
//  DataHelper.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import RealmSwift
import UIKit

let realm = try! Realm()


class DataHelper {
    static func seed(){
        let grau = Grau(value: ["id":NSUUID().UUIDString, "nom":"Grau d'Enginyeria Informàtica"])
        
        let assignatura1 = Assignatura(value: ["id":NSUUID().UUIDString, "tag":"ED", "nom": "Estructures de Dades", "grau":grau])
        grau.assignatures.append(assignatura1)
        
        let assignatura2 = Assignatura(value: ["id":NSUUID().UUIDString, "tag":"BD", "nom": "Bases de Dades", "grau":grau])
        grau.assignatures.append(assignatura2)
        
        let assignatura3 = Assignatura(value: ["id":NSUUID().UUIDString, "tag":"FSO", "nom": "Fonaments de Sistemes Operatius", "grau":grau])
        grau.assignatures.append(assignatura3)
        
        let assignatura4 = Assignatura(value: ["id":NSUUID().UUIDString, "tag":"MDII", "nom": "Matemàtica Discreta II", "grau":grau])
        grau.assignatures.append(assignatura4)
        let assignatura5 = Assignatura(value: ["id":NSUUID().UUIDString, "tag":"EC", "nom": "Estructura de Computadors", "grau":grau])
        grau.assignatures.append(assignatura5)
        
        let usuari = Usuari(value: ["id":NSUUID().UUIDString, "nom":"NomTEST", "cognoms":"CognokmTEST", "email":"exampletest@gmail.com"])
        usuari.graus.append(grau)
        
        current_user = usuari
        NSUserDefaults.standardUserDefaults().setObject(usuari.id, forKey: "currentUserId")
        
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
