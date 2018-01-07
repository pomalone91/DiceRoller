//
//  LogTableViewCell.swift
//  DiceRoller
//
//  Created by Paul Malone on 1/6/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import UIKit

class LogTableViewCell: UITableViewCell {

    @IBOutlet weak var rollName: UILabel!
    @IBOutlet weak var rollResult: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    func update(with log: Log) {
        rollName.text = log.roll
        rollResult.text = "\(log.result)"
        timeStamp.text = "\(log.timeStamp)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
