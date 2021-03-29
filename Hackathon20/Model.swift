//
//  Model.swift
//  Hackathon2
//
//  Created by ИГОРЬ on 22/03/2021.
//

import Foundation
import RealmSwift

class Model:Object {
    @objc dynamic var _id_ = 0
    @objc dynamic var timeAndDate:String = ""
    @objc dynamic var operation:String = ""
    @objc dynamic var target:String = ""
    @objc dynamic var sum:Float = 0.0
    @objc dynamic var type:String = ""
    
    override static func primaryKey() -> String? {
        return "_id_"
    }
}


