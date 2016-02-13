//
//  Grau.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import Foundation
import RealmSwift

class Grau: Object {
    dynamic var id = ""
    dynamic var nom = ""
    dynamic var tag = ""
    let assignatures = List<Assignatura>()

// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
