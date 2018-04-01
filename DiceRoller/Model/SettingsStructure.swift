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
    // Default color scheme
    var backGroundColor: UIColor
    var buttonColor1: UIColor
    var buttonColor2: UIColor
    var buttonColor3: UIColor
    var buttonColor4: UIColor
    var labelColor1: UIColor
    
    // Manual init
    init(backGroundColor: UIColor, buttonColor1: UIColor, buttonColor2: UIColor, buttonColor3: UIColor, buttonColor4: UIColor, labelColor1: UIColor) {
        self.backGroundColor = backGroundColor
        self.buttonColor1 = buttonColor1
        self.buttonColor2 = buttonColor2
        self.buttonColor3 = buttonColor3
        self.buttonColor4 = buttonColor4
        self.labelColor1 = labelColor1
    }
    
    // Default init
    init() {
        self.backGroundColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
        self.buttonColor1 = UIColor(displayP3Red: 73/255, green: 97/255, blue: 101/255, alpha: 1)
        self.buttonColor2 = UIColor(displayP3Red: 29/255, green: 30/255, blue: 31/255, alpha: 1)
        self.buttonColor3 = UIColor(displayP3Red: 89/255, green: 74/255, blue: 57/255, alpha: 1)
        self.buttonColor4 = UIColor(displayP3Red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
        self.labelColor1 = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
    }
}
