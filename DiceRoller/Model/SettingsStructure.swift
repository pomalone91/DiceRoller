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

protocol ColorPaletteDelegate: class {
    func didRecieveUpdateData(_ colors: ColorPalette)
}

enum Scheme {
    case basic, hell, cyber, ice, shoggoth
}
class ColorPalette {
    // Delegate variable
    weak var delegate: ColorPaletteDelegate?
    
    // Default color scheme
    var backGroundColor: UIColor
    var rollColor: UIColor
    var modifierColor: UIColor
    var dieColor: UIColor
    var clearColor: UIColor
    var labelColor: UIColor
    var textColor: UIColor
    
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
            self.textColor = UIColor.white
        case .hell:
            self.backGroundColor = UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1)
            self.rollColor = UIColor(red: 80/255, green: 8/255, blue: 3/255, alpha: 1)
            self.modifierColor = UIColor(red: 84/255, green: 82/255, blue: 82/255, alpha: 1)
            self.dieColor = UIColor.black
            self.clearColor = UIColor(red: 29/255, green: 54/255, blue: 53/255, alpha: 1)
            self.labelColor = UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1)
            self.textColor = UIColor.white
        case .cyber:
            self.backGroundColor = UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1)
            self.rollColor = UIColor(red: 80/255, green: 8/255, blue: 3/255, alpha: 1)
            self.modifierColor = UIColor(red: 84/255, green: 82/255, blue: 82/255, alpha: 1)
            self.dieColor = UIColor.black
            self.clearColor = UIColor(red: 29/255, green: 54/255, blue: 53/255, alpha: 1)
            self.labelColor = UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1)
            self.textColor = UIColor.white
        case .ice:
            self.backGroundColor = UIColor.white
            self.rollColor = UIColor(displayP3Red: 100/255, green: 165/255, blue: 244/255, alpha: 1)
            self.modifierColor = UIColor(red: 140/255, green: 209/255, blue: 247/255, alpha: 1)
            self.dieColor = UIColor(red: 140/255, green: 209/255, blue: 247/255, alpha: 1)
            self.clearColor = UIColor(red: 140/255, green: 209/255, blue: 247/255, alpha: 1)
            self.labelColor = UIColor.white
            self.textColor = UIColor.black
        default:
            self.backGroundColor = UIColor(displayP3Red: 208/255, green: 232/255, blue: 235/255, alpha: 1)
            self.rollColor = UIColor(displayP3Red: 235/255, green: 231/255, blue: 237/255, alpha: 1)
            self.modifierColor = UIColor(displayP3Red: 29/255, green: 30/255, blue: 31/255, alpha: 1)
            self.dieColor = UIColor(displayP3Red: 89/255, green: 74/255, blue: 57/255, alpha: 1)
            self.clearColor = UIColor(displayP3Red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
            self.labelColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
            self.textColor = UIColor.white
        }
    }
    // Manual init
    init(backGroundColor: UIColor, rollColor: UIColor, modifierColor: UIColor, dieColor: UIColor, clearColor: UIColor, labelColor: UIColor, textColor: UIColor) {
        self.backGroundColor = backGroundColor
        self.rollColor = rollColor
        self.modifierColor = modifierColor
        self.dieColor = dieColor
        self.clearColor = clearColor
        self.labelColor = labelColor
        self.textColor = textColor
    }
    
    // Default init
    init() {
        self.backGroundColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
        self.rollColor = UIColor(displayP3Red: 73/255, green: 97/255, blue: 101/255, alpha: 1)
        self.modifierColor = UIColor(displayP3Red: 29/255, green: 30/255, blue: 31/255, alpha: 1)
        self.dieColor = UIColor(displayP3Red: 89/255, green: 74/255, blue: 57/255, alpha: 1)
        self.clearColor = UIColor(displayP3Red: 128/255, green: 0/255, blue: 0/255, alpha: 1)
        self.labelColor = UIColor(displayP3Red: 42/255, green: 50/255, blue: 63/255, alpha: 1)
        self.textColor = UIColor.white
    }
}

