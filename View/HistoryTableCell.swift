//
//  HistoryTableCell.swift
//  WeCash
//
//  Created by knight on 10/8/20.
//

import UIKit

class HistoryTableCell: UITableViewCell {

    
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
