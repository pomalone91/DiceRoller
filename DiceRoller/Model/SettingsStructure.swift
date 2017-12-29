//
//  SettingsStructure.swift
//  DiceRoller
//
//  Created by Paul Malone on 11/21/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

/* This structure will describe the color profile of the entire app.
 * Create structure to describe colors for all buttons and backgrounds
 * create a method that can be called in the viewDidLoad method to change the color before the view is loaded
 * Create prepare(for segue) functions to pass the settings object between viewControllers so they all display the same colors
 */
import Foundation
import UIKit

struct ColorPalette {
    var backGroundColor: UIColor
    var dieButtonColor: UIColor
    var modifierButtonColor: UIColor
    var resultLabelColor: UIColor
    var clearButtonColor: UIColor
    var rollDieButtonColor: UIColor
    
    init(backGroundColor: UIColor, dieButtonColor: UIColor, modifierButtonColor: UIColor, resultLabelColor: UIColor, clearButtonColor: UIColor, rollDieButtonColor: UIColor) {
        self.backGroundColor = backGroundColor
        self.dieButtonColor = dieButtonColor
        self.modifierButtonColor = modifierButtonColor
        self.resultLabelColor = resultLabelColor
        self.clearButtonColor = clearButtonColor
        self.rollDieButtonColor = rollDieButtonColor
    }
}
