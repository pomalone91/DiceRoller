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

enum Scheme {
    case basic, hell, cyber, ice, shoggoth
}

struct ColorPalette {
    // Default color scheme
    var backGroundColor: UIColor
    var rollColor: UIColor
    var modifierColor: UIColor
    var dieColor: UIColor
    var clearColor: UIColor
    var labelColor: UIColor
    
    // Scheme based init
    init(_ scheme: Scheme) {
        switch scheme {
        case .basic:
            self.backGroundColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
            self.rollColor = UIColor(displayP3Red: 73/255, green: 97/255, blue: 101/255, alpha: 1)
            self.modifierColor = UIColor(displayP3Red: 29/255, green: 30/255, blue: 31/255, alpha: 1)
            self.dieColor = UIColor(displayP3Red: 89/255, green: 74/255, blue: 57/255, alpha: 1)
            self.clearColor = UIColor(displayP3Red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
            self.labelColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
        case .hell:
            self.backGroundColor = UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1)
            self.rollColor = UIColor(red: 80/255, green: 8/255, blue: 3/255, alpha: 1)
            self.modifierColor = UIColor(red: 84/255, green: 82/255, blue: 82/255, alpha: 1)
            self.dieColor = UIColor.black
            self.clearColor = UIColor(red: 29/255, green: 54/255, blue: 53/255, alpha: 1)
            self.labelColor = UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1)
        default:
            self.backGroundColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
            self.rollColor = UIColor(displayP3Red: 73/255, green: 97/255, blue: 101/255, alpha: 1)
            self.modifierColor = UIColor(displayP3Red: 29/255, green: 30/255, blue: 31/255, alpha: 1)
            self.dieColor = UIColor(displayP3Red: 89/255, green: 74/255, blue: 57/255, alpha: 1)
            self.clearColor = UIColor(displayP3Red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
            self.labelColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
        }
    }
    // Manual init
    init(backGroundColor: UIColor, rollColor: UIColor, modifierColor: UIColor, dieColor: UIColor, clearColor: UIColor, labelColor: UIColor) {
        self.backGroundColor = backGroundColor
        self.rollColor = rollColor
        self.modifierColor = modifierColor
        self.dieColor = dieColor
        self.clearColor = clearColor
        self.labelColor = labelColor
    }
    
    // Default init
    init() {
        self.backGroundColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
        self.rollColor = UIColor(displayP3Red: 73/255, green: 97/255, blue: 101/255, alpha: 1)
        self.modifierColor = UIColor(displayP3Red: 29/255, green: 30/255, blue: 31/255, alpha: 1)
        self.dieColor = UIColor(displayP3Red: 89/255, green: 74/255, blue: 57/255, alpha: 1)
        self.clearColor = UIColor(displayP3Red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
        self.labelColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
    }
    
}

