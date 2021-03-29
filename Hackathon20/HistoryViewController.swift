//
//  HistoryViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 26/03/2021.
//

import UIKit


class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let oper = Oper()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
}

extension HistoryViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oper.opertable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.dateTimeLabel.text = oper.opertable[indexPath.row].timeAndDate
        cell.operatinLabel.text = oper.opertable[indexPath.row].operation
        cell.sumLabel.text = String(oper.opertable[indexPath.row].sum)
        let type = oper.opertable[indexPath.row].type
        switch type {
        case "put":
            cell.operImage.image = UIImage(named: "ruble1")
        case "get":
            cell.operImage.image = UIImage(named: "ruble2")
        case "tel":
            cell.operImage.image = UIImage(named: "itelephone")
        
        default:
            cell.operImage.image = UIImage(named: "question")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
}
