//
//  OperationViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 25/03/2021.
//

import UIKit

class OperationViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    var txt:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLabel.text = txt

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
