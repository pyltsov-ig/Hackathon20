//
//  TableViewCell.swift
//  Hackathon20
//
//  Created by ИГОРЬ on 26/03/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var operatinLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var operImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
