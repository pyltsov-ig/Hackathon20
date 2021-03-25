//
//  ViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 25/03/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var putcashBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dest = segue.destination as? OperationViewController else {return}
        
       // dest.txt = "ferferfef"
        
        let selection = segue.identifier ?? "NONE"
//
        if selection == "putcash" {
            dest.txt = putcashBtn.titleLabel?.text ?? ""
        }
        
        
      
        
    }
    
}

