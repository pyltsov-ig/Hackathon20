//
//  ViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 25/03/2021.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var putcashBtn: UIButton!
    @IBOutlet weak var witdrawBtn: UIButton!
    @IBOutlet weak var chargeBtn: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    
    let realm = try! Realm()
    lazy var opertable : Results<Model> = {self.realm.objects(Model.self)}()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //showBalance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        showBalance()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dest = segue.destination as? OperationViewController else {return}
        
        
        let selection = segue.identifier ?? "NONE"
        
        if selection == "putcash" {
            dest.txt = putcashBtn.titleLabel?.text ?? ""
            dest.img = UIImage(named: "put_cash")!
            dest.opr = "put"
        }
        
        if selection == "withdraw" {
            dest.txt = witdrawBtn.titleLabel?.text ?? ""
            dest.img = UIImage(named: "get_cash")!
            dest.opr = "get"
        }
        
        if selection == "chargephone" {
            dest.txt = chargeBtn.titleLabel?.text ?? ""
            dest.img = UIImage(named: "mobile_phone")!
            dest.opr = "chr"
        }
    }
    
    func showBalance() {
        
        var balance:Float = 0
        
        for index in 0..<opertable.count {
            balance += self.opertable[index].sum
        }
        balanceLabel.text = String(balance)
    }
    
}

