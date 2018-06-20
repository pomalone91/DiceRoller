//
//  GroupTableViewCell.swift
//  DiceRoller
//
//  Created by Paul Malone on 6/13/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(with group: RollGroup) {
        groupNameLabel.text = group.groupName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
