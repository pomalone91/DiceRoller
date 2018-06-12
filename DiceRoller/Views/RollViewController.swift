//
//  ViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 8/11/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

/* TODO:
    1. Add a settings screen with color palletes
    3. Add a log
 */
import UIKit

class RollViewController: UIViewController {
    //  Create the dice
    var dice = [Die(type: .d4, totalDice: 1 , modifier: 0),
               Die(type: .d6, totalDice: 1 , modifier: 0),
               Die(type: .d8, totalDice: 1 , modifier: 0),
               Die(type: .d10, totalDice: 1 , modifier: 0),
               Die(type: .d12, totalDice: 1 , modifier: 0),
               Die(type: .d20, totalDice: 1 , modifier: 0),
               Die(type: .d100, totalDice: 1 , modifier: 0)]
    
    // Create the timer
    var timer = Timer()
    let timerInterval = 0.3
    
    // Array of strings to hold items to add to the log.
    // Whatever is in the array will be appended to an array in the LogViewController to be displayed.
    // When this view willAppear, the array in this view controller will be cleared out so the same stuff isn't appended more than once
    var rollsToLog: [Log] = []
    
    // ColorScheme object to hold the main color scheme
    var colorScheme = ColorPalette()
    
    // Screen size
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    //  Outlet for result label
    @IBOutlet weak var resultLabel: UILabel!
   
    //  Outlet for dice roller buttons
    @IBOutlet var buttonText: [UIButton]!    
    
    // Outlets for rounding edges of buttons
    @IBOutlet var subtractDieLabel: [UIButton]!
    @IBOutlet var addDieLabel: [UIButton]!
    @IBOutlet var subtractModifierLabel: [UIButton]!
    @IBOutlet var addModifierLabel: [UIButton]!
    @IBOutlet weak var clearLabel: UIButton!
    
    // Constraint outlets
    @IBOutlet weak var resultLabelConstraint: NSLayoutConstraint!
    @IBOutlet var dieRowConstraints: [NSLayoutConstraint]!
    
    // Function to update all of the labels
    func updateLabels(_ senderTag: Int, _ die: Die) {
        if die.modifier < 0 {
            buttonText[senderTag].setTitle("\(die.totalDice)\(die.type)\(die.modifier)", for: .normal)
        } else {
            buttonText[senderTag].setTitle("\(die.totalDice)\(die.type)+\(die.modifier)", for: .normal)
        }
    }
    
    // Release button to end timer
    // This action is connected to touch up outside/inside for each button
    @IBAction func buttonReleased(_ sender: Any) {
        timer.invalidate()
    }
    
    // Press down on remove dice button
    @IBAction func removeDiceDown(_ sender: UIButton) {
        timer.invalidate()
        removeDice(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.removeDice(senderTag: sender.tag)})
    }
    
    // Function to remove dice
    func removeDice(senderTag: Int) {
        // Get the die to remove from
        var dieToRemove = dice[senderTag]
        dieToRemove.removeDie()
        
        // Update the button label, use sender.tag for the array index
        updateLabels(senderTag, dieToRemove)
        
        // Update the actual die instance so every thing is up to date next time this is called.
        dice[senderTag] = dieToRemove
    }
    
    // Press and hold to add dice continuously
    @IBAction func addDiceDown(_ sender: UIButton) {
        timer.invalidate()
        addDice(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.addDice(senderTag: sender.tag)})
    }
    
    //  Function for adding dice
    func addDice(senderTag: Int) {
        var dieToAdd = dice[senderTag]
        
        // Actually remove the die
        dieToAdd.addDie()
        
        // Update the button label, use sender.tag for the array index
        updateLabels(senderTag, dieToAdd)
        
        // Update the actual die instance so every thing is up to date next time this is called.
        dice[senderTag] = dieToAdd
    }
    
    //  Action for subtracting modifier
    @IBAction func removeModifierDown(_ sender: UIButton) {
        timer.invalidate()
        subtractModifier(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.subtractModifier(senderTag: sender.tag)})
    }
    
    func subtractModifier(senderTag: Int) {
        var modifierToSubtract = dice[senderTag]
        
        // Actually remove the die
        modifierToSubtract.removeModifier()
        
        // Update the button label, use sender.tag for the array index
        updateLabels(senderTag, modifierToSubtract)
        
        // Update the actual die instance so every thing is up to date next time this is called.
        dice[senderTag] = modifierToSubtract
    }
    
    //  Action for adding modifier
    @IBAction func addModifierDown(_ sender: UIButton) {
        timer.invalidate()
        addModifier(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.addModifier(senderTag: sender.tag)})
    }
    func addModifier(senderTag: Int) {
        var modifierToAdd = dice[senderTag]
        
        // Actually remove the die
        modifierToAdd.addModifier()
        
        // Update the button label, use sender.tag for the array index
        // Also append the result of the roll to rollsToLog
        updateLabels(senderTag, modifierToAdd)
        
        // Update the actual die instance so every thing is up to date next time this is called.
        dice[senderTag] = modifierToAdd
    }
    
    // Action for rolling dice
    @IBAction func diceRollPressed(_ sender: UIButton) {
        let dieToRoll = dice[sender.tag]
        
        // Update the results label
        let resultValue = dieToRoll.rollDie()
        resultLabel.text = "\(resultValue)"
        
        // Update the title on the button
        if dieToRoll.modifier < 0 {
            sender.setTitle("\(dieToRoll.totalDice)\(dieToRoll.type)\(dieToRoll.modifier)", for: .normal)
            let newLogItem = Log(roll: "\(dieToRoll.totalDice)\(dieToRoll.type)\(dieToRoll.modifier)", result: resultValue)
            rollsToLog.append(newLogItem)
        } else {
            sender.setTitle("\(dieToRoll.totalDice)\(dieToRoll.type)+\(dieToRoll.modifier)", for: .normal)
            let newLogItem = Log(roll: "\(dieToRoll.totalDice)\(dieToRoll.type)+\(dieToRoll.modifier)", result: resultValue)
            rollsToLog.append(newLogItem)
        }
        
    }
    
    // Action for clearing all modifiers and reset labels
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        // Clear result label
        resultLabel.text = ""
        
        // Reset modifiers
        // Loop through the array of dice and call the resetDie() method on it
        var i = 0
        while i < dice.count {
            dice[i].resetDie()
            i += 1
        }
        
        // Reset die labels
        // Loop through each button and reset everything.
        i = 0
        while i < dice.count {
            buttonText[i].setTitle("\(dice[i].totalDice)\(dice[i].type)+\(dice[i].modifier)", for: .normal)
            i += 1
        }
        
        print(rollsToLog)
    }
    
    // Function to make buttons rounded
    func roundButtons() {
        for i in 0...buttonText.count - 1 {
            buttonText[i].layer.cornerRadius = 15
            subtractDieLabel[i].layer.cornerRadius = 25
            addDieLabel[i].layer.cornerRadius = 25
            subtractModifierLabel[i].layer.cornerRadius = 25
            addModifierLabel[i].layer.cornerRadius = 25
        }
        
        clearLabel.layer.cornerRadius = 20
    }
    
    // Function to load the color scheme
    func loadColorScheme() {
        // Set subtract die labels
        for label in subtractDieLabel {
            label.backgroundColor = colorScheme.dieColor
            label.setTitleColor(colorScheme.textColor, for: .normal)
        }
        // Set add die labels
        for label in addDieLabel {
            label.backgroundColor = colorScheme.dieColor
            label.setTitleColor(colorScheme.textColor, for: .normal)
        }
        // Set roll button color
        for button in buttonText {
            button.backgroundColor = colorScheme.rollColor
            button.setTitleColor(colorScheme.textColor, for: .normal)
        }
        // Set add modifier
        for button in addModifierLabel {
            button.backgroundColor = colorScheme.modifierColor
            button.setTitleColor(colorScheme.textColor, for: .normal)
        }
        // Set remove modifier
        for button in subtractModifierLabel {
            button.backgroundColor = colorScheme.modifierColor
            button.setTitleColor(colorScheme.textColor, for: .normal)
        }
        // Set background, result label, clear button, log button, settings button
        view.backgroundColor = colorScheme.backGroundColor
        resultLabel.backgroundColor = colorScheme.labelColor
        resultLabel.textColor = colorScheme.textColor
        clearLabel.backgroundColor = colorScheme.clearColor
        clearLabel.setTitleColor(colorScheme.textColor, for: .normal)
    }
    
    // Set up for SE and 4s
    func setUpForSmallScreens() {
        if screenHeight <= 568 {
            resultLabelConstraint.constant = 40
            for constaint in dieRowConstraints {
                constaint.constant = 40
            }
            for i in 0...buttonText.count - 1 {
                buttonText[i].layer.cornerRadius = 10
                buttonText[i].titleLabel?.font = UIFont(name: "System Font Regular", size: 15.0)
                subtractDieLabel[i].layer.cornerRadius = 15
                subtractDieLabel[i].titleLabel?.font = UIFont(name: "System Font Regular", size: 15.0)
                addDieLabel[i].layer.cornerRadius = 15
                subtractModifierLabel[i].layer.cornerRadius = 15
                addModifierLabel[i].layer.cornerRadius = 15
            }
            
            clearLabel.layer.cornerRadius = 10
        }
    }
    
    // Function to load roll log into this view from tab bar
    func getRollLog() {
        let tabBar = tabBarController as! TabViewController
        rollsToLog = []
        rollsToLog.append(contentsOf: tabBar.rollLog)
    }
    
    // Log Rolls back to TabBar
    func logRolls() {
        let tabBar = tabBarController as! TabViewController
        tabBar.rollLog = []
        tabBar.rollLog.append(contentsOf: rollsToLog)
    }

    // Stuff to hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        // Get roll Log
        getRollLog()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! TabViewController
        colorScheme = tabBar.colorScheme
        loadColorScheme()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Invalidate any timers that might still be going
        timer.invalidate()
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        // Send new rolls to TabBar
        logRolls()
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            roundButtons()
            loadColorScheme()
            print(screenWidth)
            print(screenHeight)
            setUpForSmallScreens()
            
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

