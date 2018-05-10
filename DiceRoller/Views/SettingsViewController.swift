//
//  SettingsViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 11/8/17.
//  Copyright © 2017 stroggi. All rights reserved.
//
// TODO: Design color pallettes
//       Design the settings view layout

import UIKit

class SettingsViewController: UIViewController {
    // Array of color palettes
//    let colorChoices: [ColorPalette] = [
//        ColorPalette(),
//        ColorPalette(backGroundColor: UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1) , rollColor: UIColor(red: 80/255, green: 8/255, blue: 3/255, alpha: 1/255), modifierColor: UIColor(red: 84/255, green: 82/255, blue: 82/255, alpha: 1/255), dieColor: UIColor.black, clearColor: UIColor(red: 90/255, green: 54/255, blue: 53/255, alpha: 1), labelColor: UIColor(red: 41/255, green: 14/255, blue: 12/255, alpha: 1)),
//        ColorPalette(backGroundColor: UIColor.gray, rollColor: UIColor.blue, modifierColor: UIColor.brown, dieColor: UIColor.red, clearColor: UIColor.purple, labelColor: UIColor.green),
//        ColorPalette(backGroundColor: UIColor.green, rollColor: UIColor.blue, modifierColor: UIColor.brown, dieColor: UIColor.red, clearColor: UIColor.purple, labelColor: UIColor.green),
//        ColorPalette(backGroundColor: UIColor.white, rollColor: UIColor.blue, modifierColor: UIColor.brown, dieColor: UIColor.red, clearColor: UIColor.purple, labelColor: UIColor.green)]
//
    // chosen color to pass in segue
    var chosenColor = ColorPalette()
    
    @IBAction func themePressed(_ sender: UIButton) {
        var scheme: Scheme
        switch sender.tag {
        case 0:
            scheme = .basic
        case 1:
            scheme = .hell
        case 2:
            scheme = .cyber
        case 3:
            scheme = .ice
        case 4:
            scheme = .shoggoth
        default:
            scheme = .basic
        }
        chosenColor = ColorPalette(scheme)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rollViewController = segue.destination as! RollViewController
        rollViewController.colorScheme = chosenColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
