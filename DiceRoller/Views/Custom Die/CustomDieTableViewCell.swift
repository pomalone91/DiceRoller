//
//  CustomDieTableViewCell.swift
//  DiceRoller
//
//  Created by Paul Malone on 6/22/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import UIKit

class CustomDieTableViewCell: UITableViewCell {
    
    var die: Die?
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    
    @IBAction func editTapped(_ sender: Any) {
        // Segue to add/edit but with this die's info
    }
    @IBAction func rollTapped(_ sender: Any) {
        guard let tappedDie = self.die else { return }
        resultLabel.text = "\(tappedDie.rollDie())"
    }
    
    func update(with die: Die) {
        rollButton.setTitle(die.description, for: .normal)
        self.die = die
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
