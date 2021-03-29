//
//  ViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 25/03/2021.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var putcashBtn: UIButton!
    @IBOutlet weak var witdrawBtn: UIButton!
    @IBOutlet weak var chargeBtn: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    
    let oper = Oper()


    override func viewDidLoad() {
        super.viewDidLoad()
        //showBalance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        balanceLabel.text = String(oper.balance)
        
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
            dest.opr = "tel"
        }
    }
    
}

