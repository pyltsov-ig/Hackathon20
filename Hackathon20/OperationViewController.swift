//
//  OperationViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 25/03/2021.
//

import UIKit
import RealmSwift

class OperationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var operImage: UIImageView!
    @IBOutlet weak var inputSumField: UITextField!
    
    var txt:String = ""
    var img:UIImage = UIImage(named: "question")!
    var opr:String = ""

    
    let realm = try! Realm()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLabel.text = txt
        self.operImage.image = img
        //self.opr = ""
        
        inputSumField.delegate = self
        
        print(realm.configuration.fileURL)
        


        // Do any additional setup after loading the view.
    }
    
   // этот метод используем для того, чтобы в поле можно было ввести только циры и знак "."
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == inputSumField {
            let allowedCharacters = CharacterSet(charactersIn: ".0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    @IBAction func okBtnAction(_ sender: UIButton) {
        
        guard let sum = Float(inputSumField.text!) else {return}
        
        switch self.opr{
        case "put":
            putMoney(sum: sum)
        case "get":
            getMoney(sum: sum)
        case "chr":
            chargePhone(sum: sum)
        default:
            return
        }
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    func putMoney(sum:Float) {
        
        let oper = Model()
        
        //записываем дату и время
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy hh:mm:ss"
        let now = df.string(from: Date())
        oper.timeAndDate = now
        
        oper.operation = "Пополнение счета"
        oper.sum = sum
        oper.type = "cashin"
        
        try! realm.write {realm.add(oper)}
    }
    
    func getMoney(sum:Float) {
        
        let oper = Model()
        
        //записываем дату и время
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy hh:mm:ss"
        let now = df.string(from: Date())
        oper.timeAndDate = now
        
        oper.operation = "Списание со счета"
        oper.sum = -sum
        oper.type = "cashout"
        
        try! realm.write {realm.add(oper)}

    }
    
    func chargePhone(sum:Float) {
        let oper = Model()
        
        //записываем дату и время
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy hh:mm:ss"
        let now = df.string(from: Date())
        oper.timeAndDate = now
        
        oper.operation = "Пополнение счета телефона"
        oper.sum = -sum
        oper.type = "phone"
        
        try! realm.write {realm.add(oper)}

    }
}
