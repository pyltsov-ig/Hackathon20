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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        balanceLabel.text = String(format:"%.2f", oper.balance) + " руб."
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dest = segue.destination as? OperationViewController else {return}
        
        
        let selection = segue.identifier ?? "NONE"
        
        dest.opr = selection
        if selection == "put" {
            dest.txt = putcashBtn.titleLabel?.text ?? ""
            dest.img = UIImage(named: "put_cash")!
        }
        
        if selection == "get" {
            dest.txt = witdrawBtn.titleLabel?.text ?? ""
            dest.img = UIImage(named: "get_cash")!
        }
        
        if selection == "tel" {
            dest.txt = chargeBtn.titleLabel?.text ?? ""
            dest.img = UIImage(named: "mobile_phone")!
        }
        
    }
    
}

