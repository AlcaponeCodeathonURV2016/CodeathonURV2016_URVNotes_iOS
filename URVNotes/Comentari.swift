//
//  Comentari.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import Foundation
import RealmSwift

class Comentari: Object {
    dynamic var id = ""
    dynamic var owner: Usuari?
    dynamic var apunt: Apunt?
    dynamic var value = ""
    dynamic var descripcio = ""
    dynamic var likes = 0
    dynamic var dislikes = 0
    dynamic var data = NSDate()
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
