//
//  ApuntImatge.swift
//  URVNotes
//
//  Created by Oscar Blanco Castan on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import Foundation
import RealmSwift

class ApuntImatge: Object {
    dynamic var id = ""
    dynamic var apunt: Apunt?
    dynamic var position = 0
    dynamic var nsurlfilemanager = ""
    dynamic var local = false
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
