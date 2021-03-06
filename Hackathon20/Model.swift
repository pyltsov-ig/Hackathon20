//
//  Model.swift
//  Hackathon2
//
//  Created by ИГОРЬ on 22/03/2021.
//

import Foundation
import RealmSwift

class Model:Object {
    @objc dynamic var _id_ = ObjectId.generate()
    @objc dynamic var timeAndDate:String = ""
    @objc dynamic var operation:String = ""
    @objc dynamic var target:String = ""
    @objc dynamic var sum:Float = 0.0
    @objc dynamic var type:String = ""
    
    override static func primaryKey() -> String? {
        return "_id_"
    }
}

class Oper {
    
    let realm = try! Realm()
    
    lazy var opertable : Results<Model> = {self.realm.objects(Model.self).sorted(byKeyPath: "sum", ascending: true)}()
    

    var balance: Float {
        get {
            var b:Float = 0
            for index in 0..<opertable.count {
                b += opertable[index].sum
            }
            return b
        }
    }
    
    
    
    func addOper(sum:Float, type:String) {
        
        let model = Model()
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy hh:mm:ss"
        let now = df.string(from: Date())
        

        model.timeAndDate = now
        model.type = type
        switch type {
        case "put" :
            model.operation = "Пополнение счета"
            model.sum = sum
        case "get":
            model.operation = "Списание со счета"
            model.sum = -sum
        case "tel":
            model.operation = "Пополнение счета телефона"
            model.sum = -sum
        default:
            model.operation = ""
            model.sum = 0
        }        
        
        try! self.realm.write {self.realm.add(model)}
    }
    
    func sortByDate(ascending:Bool) {
        opertable = self.realm.objects(Model.self).sorted(byKeyPath: "_id_", ascending: ascending)
    }
    
    func sortBySum(asceding:Bool) {
        opertable = self.realm.objects(Model.self).sorted(byKeyPath: "sum", ascending: asceding)
    }
        
}


