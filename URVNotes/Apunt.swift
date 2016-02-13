//
//  Apunt.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import Foundation
import RealmSwift

class Apunt: Object {
    dynamic var propietari: Usuari?
    dynamic var assignatura: Assignatura?
    dynamic var titol = ""
    dynamic var descripcio = ""
    dynamic var likes = 0
    dynamic var dislikes = 0
    dynamic var data = NSDate()
    
    let imatges = List<ApuntImatge>()
    let comentaris = List<Comentari>()
    // Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
