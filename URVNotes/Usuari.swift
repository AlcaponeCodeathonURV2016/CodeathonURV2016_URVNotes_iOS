//
//  Usuari.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import Foundation
import RealmSwift

class Usuari: Object {
    dynamic var id = ""
    dynamic var nom = ""
    dynamic var cognoms = ""
    dynamic var email = ""
    
    let graus = List<Grau>()
    let apunts = List<Apunt>()
    let comentaris = List<Comentari>()
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
