//
//  OperationViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 25/03/2021.
//

import UIKit


class OperationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var operImage: UIImageView!
    @IBOutlet weak var inputSumField: UITextField!
    
  
    
    var txt:String = ""
    var img:UIImage = UIImage(named: "question")!
    var opr:String = ""

    let oper = Oper()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        view.addGestureRecognizer(tap)
        
        self.textLabel.text = txt
        self.operImage.image = img
        
        inputSumField.delegate = self
        
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
        self.oper.addOper(sum: sum, type: self.opr)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
}
