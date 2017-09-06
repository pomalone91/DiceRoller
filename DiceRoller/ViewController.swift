//
//  ViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 8/11/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  Dice
    var d4 = Die(type: .d4, totalDice: 1, modifier: 0)
    var d6 = Die(type: .d6, totalDice: 1, modifier: 0)
    var d8 = Die(type: .d8, totalDice: 1, modifier: 0)
    var d10 = Die(type: .d10, totalDice: 1, modifier: 0)
    var d12 = Die(type: .d12, totalDice: 1, modifier: 0)
    var d20 = Die(type: .d20, totalDice: 1, modifier: 0)
    var d100 = Die(type: .d100, totalDice: 1, modifier: 0)

    
    //  Outlet for result label
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rollLabel: UILabel!
   
    //  Outlets for dice roller buttons

    @IBOutlet weak var d4ButtonText: UIButton!
    @IBOutlet weak var d6ButtonText: UIButton!
    @IBOutlet weak var d8ButtonText: UIButton!
    @IBOutlet weak var d10ButtonText: UIButton!
    @IBOutlet weak var d12ButtonText: UIButton!
    @IBOutlet weak var d20ButtonText: UIButton!
    @IBOutlet weak var d100ButtonText: UIButton!
    
    //  Outlets for modifier labels
    @IBOutlet weak var d4ModifierLabel: UILabel!
    @IBOutlet weak var d6ModifierLabel: UILabel!
    @IBOutlet weak var d8ModifierLabel: UILabel!
    @IBOutlet weak var d10ModifierLabel: UILabel!
    @IBOutlet weak var d12ModifierLabel: UILabel!
    @IBOutlet weak var d20ModifierLabel: UILabel!
    @IBOutlet weak var d100ModifierLabel: UILabel!
    
    // Also, lets figure out a better more generalized way to work with all these buttons.
        // Make collection of buttons
        // Write function that takes what kind of dice is being rolled as an argument.
        // For each button action, call that function and pass the relevant type of dice
        // Do something similar for modifiers and die adders
    
    // TODO - Update app so there is no roll label, and the dice string is displayed in the button pressed to roll it, including the modifier.
    func setd4Labels() {
        // TODO - generalize process of setting the labels when anything is updated
        if d4.modifier < 0 {
            rollLabel.text = "\(d4.totalDice)\(d4.type)\(d4.modifier)\t="
            d4ModifierLabel.text = "\(d4.modifier)"
        } else {
            rollLabel.text = "\(d4.totalDice)\(d4.type)+\(d4.modifier)\t="
            d4ModifierLabel.text = "\(d4.modifier)"
        }
        d4ButtonText.setTitle("\(d4.totalDice)\(d4.type)", for: .normal)
    }
    
    func setd6Labels() {
        // TODO - generalize process of setting the labels when anything is updated
        if d6.modifier < 0 {
            rollLabel.text = "\(d6.totalDice)\(d6.type)\(d6.modifier)\t="
            d6ModifierLabel.text = "\(d6.modifier)"
        } else {
            rollLabel.text = "\(d6.totalDice)\(d6.type)+\(d6.modifier)\t="
            d6ModifierLabel.text = "\(d6.modifier)"
        }
        d6ButtonText.setTitle("\(d6.totalDice)\(d6.type)", for: .normal)
    }
    
    func setd8Labels() {
        // TODO - generalize process of setting the labels when anything is updated
        if d8.modifier < 0 {
            rollLabel.text = "\(d8.totalDice)\(d8.type)\(d8.modifier)\t="
            d8ModifierLabel.text = "\(d8.modifier)"
        } else {
            rollLabel.text = "\(d8.totalDice)\(d8.type)+\(d8.modifier)\t="
            d8ModifierLabel.text = "\(d8.modifier)"
        }
        d8ButtonText.setTitle("\(d8.totalDice)\(d8.type)", for: .normal)
    }
    
    func setd10Labels() {
        // TODO - generalize process of setting the labels when anything is updated
        if d10.modifier < 0 {
            rollLabel.text = "\(d10.totalDice)\(d10.type)\(d10.modifier)\t="
            d10ModifierLabel.text = "\(d10.modifier)"
        } else {
            rollLabel.text = "\(d10.totalDice)\(d10.type)+\(d10.modifier)\t="
            d10ModifierLabel.text = "\(d10.modifier)"
        }
        d10ButtonText.setTitle("\(d10.totalDice)\(d10.type)", for: .normal)
    }
    
    func setd12Labels() {
        // TODO - generalize process of setting the labels when anything is updated
        if d12.modifier < 0 {
            rollLabel.text = "\(d12.totalDice)\(d12.type)\(d12.modifier)\t="
            d12ModifierLabel.text = "\(d12.modifier)"
        } else {
            rollLabel.text = "\(d12.totalDice)\(d12.type)+\(d12.modifier)\t="
            d12ModifierLabel.text = "\(d12.modifier)"
        }
        d12ButtonText.setTitle("\(d12.totalDice)\(d12.type)", for: .normal)
    }
    
    func setd20Labels() {
        // TODO - generalize process of setting the labels when anything is updated
        if d20.modifier < 0 {
            rollLabel.text = "\(d20.totalDice)\(d20.type)\(d20.modifier)\t="
            d20ModifierLabel.text = "\(d20.modifier)"
        } else {
            rollLabel.text = "\(d20.totalDice)\(d20.type)+\(d20.modifier)\t="
            d20ModifierLabel.text = "\(d20.modifier)"
        }
        d20ButtonText.setTitle("\(d20.totalDice)\(d20.type)", for: .normal)
    }
    
    func setd100Labels() {
        // TODO - generalize process of setting the labels when anything is updated
        if d100.modifier < 0 {
            rollLabel.text = "\(d100.totalDice)\(d100.type)\(d100.modifier)\t="
            d100ModifierLabel.text = "\(d100.modifier)"
        } else {
            rollLabel.text = "\(d100.totalDice)\(d100.type)+\(d100.modifier)\t="
            d100ModifierLabel.text = "\(d100.modifier)"
        }
        d100ButtonText.setTitle("\(d100.totalDice)\(d100.type)", for: .normal)
    }
    
    //  Actions for removing dice buttons
    @IBAction func removed100Pressed(_ sender: UIButton) {
        d4.removeDie()
        setd4Labels()
    }
    @IBAction func removeD6Pressed(_ sender: UIButton) {
        d6.removeDie()
        setd6Labels()
    }
    @IBAction func removeD8Pressed(_ sender: UIButton) {
        d8.removeDie()
        setd8Labels()
    }
    @IBAction func removeD10Pressed(_ sender: UIButton) {
        d10.removeDie()
        setd10Labels()
    }
    @IBAction func removeD12Pressed(_ sender: UIButton) {
        d12.removeDie()
        setd12Labels()
    }
    @IBAction func removeD20Pressed(_ sender: UIButton) {
        d20.removeDie()
        setd20Labels()
    }
    @IBAction func removeD100Pressed(_ sender: UIButton) {
        d100.removeDie()
        setd100Labels()
    }
    
    //  Actions for adding dice buttons
    @IBAction func addD4Pressed(_ sender: UIButton) {
        d4.addDie()
        setd4Labels()
    }
    @IBAction func addD6Pressed(_ sender: UIButton) {
        d6.addDie()
        setd6Labels()
    }
    @IBAction func addD8Pressed(_ sender: UIButton) {
        d8.addDie()
        setd8Labels()
    }
    @IBAction func addD10Pressed(_ sender: UIButton) {
        d10.addDie()
        setd10Labels()
    }
    @IBAction func addD12Pressed(_ sender: UIButton) {
        d12.addDie()
        setd12Labels()
    }
    @IBAction func addD20Pressed(_ sender: UIButton) {
        d20.addDie()
        setd20Labels()
    }
    @IBAction func addD100Pressed(_ sender: UIButton) {
        d100.addDie()
        setd100Labels()
    }
    
    //  Actions for subtracting modifier
    @IBAction func subtractD4ModifierPressed(_ sender: UIButton) {
        d4.removeModifier()
        setd4Labels()
    }
    @IBAction func subtractD6ModifierPressed(_ sender: UIButton) {
        d6.removeModifier()
        setd6Labels()
    }
    @IBAction func subtractD8ModifierPressed(_ sender: UIButton) {
        d8.removeModifier()
        setd8Labels()
    }
    @IBAction func subtractD10ModifierPressed(_ sender: UIButton) {
        d10.removeModifier()
        setd10Labels()
    }
    @IBAction func subtractD12ModifierPressed(_ sender: UIButton) {
        d12.removeModifier()
        setd12Labels()
    }
    @IBAction func subtractD20ModifierPressed(_ sender: UIButton) {
        d20.removeModifier()
        setd20Labels()
    }
    @IBAction func subtractD100ModifierPressed(_ sender: UIButton) {
        d100.removeModifier()
        setd100Labels()
    }
    
    //  Actions for adding modifier
    @IBAction func addD4ModifierPressed(_ sender: UIButton) {
        d4.addModifier()
        setd4Labels()
    }
    @IBAction func addD6ModifierPressed(_ sender: UIButton) {
        d6.addModifier()
        setd6Labels()
    }
    @IBAction func addD8ModifierPressed(_ sender: UIButton) {
        d8.addModifier()
        setd8Labels()
    }
    @IBAction func addD10ModifierPressed(_ sender: UIButton) {
        d10.addModifier()
        setd10Labels()
    }
    @IBAction func addD12ModifierPressed(_ sender: UIButton) {
        d12.addModifier()
        setd12Labels()
    }
    @IBAction func addD20ModifierPressed(_ sender: UIButton) {
        d20.addModifier()
        setd20Labels()
    }
    @IBAction func addD100ModifierPressed(_ sender: UIButton) {
        d100.addModifier()
        setd100Labels()
    }
    
    //  Actions for rolling dice
    @IBAction func rollD4Tapped(_ sender: UIButton) {
        resultLabel.text = "\(d4.rollDie())"
        setd4Labels()
    }
    @IBAction func rollD6Tapped(_ sender: UIButton) {
        resultLabel.text = "\(d6.rollDie())"
        setd6Labels()
    }
    @IBAction func rollD8Tapped(_ sender: UIButton) {
        resultLabel.text = "\(d8.rollDie())"
        setd8Labels()
    }
    @IBAction func rollD10Tapped(_ sender: UIButton) {
        resultLabel.text = "\(d10.rollDie())"
        setd10Labels()
    }
    @IBAction func rollD12Tapped(_ sender: UIButton) {
        resultLabel.text = "\(d12.rollDie())"
        setd12Labels()
    }
    @IBAction func rollD20Tapped(_ sender: UIButton) {
        resultLabel.text = "\(d20.rollDie())"
        setd20Labels()
    }
    @IBAction func rollD100Tapped(_ sender: UIButton) {
        resultLabel.text = "\(d100.rollDie())"
        setd100Labels()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

