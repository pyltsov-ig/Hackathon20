//
//  HistoryViewController.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 26/03/2021.
//

import UIKit


class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortByDateButton: UIBarButtonItem!
    @IBOutlet weak var sortBySumButton: UIBarButtonItem!
    
    let oper = Oper()
    
    var sortByDateAsc:Bool = false {
        didSet (newValue){
            if newValue {
                sortByDateButton.image = UIImage(systemName: "arrow.down")
            } else {
                sortByDateButton.image = UIImage(systemName: "arrow.up")
            }
        }
    }
    
    var sortBySumAsc:Bool = true {
        didSet (newValue) {
            if newValue {
                sortBySumButton.image = UIImage(systemName: "arrowtriangle.down.fill")
            } else {
                sortBySumButton.image = UIImage(systemName: "arrowtriangle.up.fill")
            }
        }
    }
    
     
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        sortByDateButton.image = UIImage(systemName: "arrow.down")
        sortBySumButton.image = UIImage(systemName: "arrowtriangle.down.fill")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
  
    @IBAction func sortByDateBtn(_ sender: UIBarButtonItem) {
        if sortByDateAsc {
            oper.sortByDate(ascending: false)
        } else {
            oper.sortByDate(ascending: true)
        }
        sortByDateAsc = !sortByDateAsc
        tableView.reloadData()
    }
    
    @IBAction func sortBySumBtn(_ sender: UIBarButtonItem) {
        if sortBySumAsc {
            oper.sortBySum(asceding: false)
        } else {
            oper.sortBySum(asceding: true)
        }
        sortBySumAsc = !sortBySumAsc
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
        cell.sumLabel.text = String(format:"%.2f",oper.opertable[indexPath.row].sum)
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
