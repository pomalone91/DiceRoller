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
    let colorChoices: [ColorPalette] = [
        ColorPalette(),
        ColorPalette(backGroundColor: UIColor.blue, buttonColor1: UIColor.red, buttonColor2: UIColor.brown, buttonColor3: UIColor.red, buttonColor4: UIColor.purple, labelColor1: UIColor.green),
        ColorPalette(backGroundColor: UIColor.gray, buttonColor1: UIColor.blue, buttonColor2: UIColor.brown, buttonColor3: UIColor.red, buttonColor4: UIColor.purple, labelColor1: UIColor.green),
        ColorPalette(backGroundColor: UIColor.green, buttonColor1: UIColor.blue, buttonColor2: UIColor.brown, buttonColor3: UIColor.red, buttonColor4: UIColor.purple, labelColor1: UIColor.green),
        ColorPalette(backGroundColor: UIColor.white, buttonColor1: UIColor.blue, buttonColor2: UIColor.brown, buttonColor3: UIColor.red, buttonColor4: UIColor.purple, labelColor1: UIColor.green)]
    
    // chosen color to pass in segue
    var chosenColor = ColorPalette()
    
    @IBAction func themePressed(_ sender: UIButton) {
        chosenColor = colorChoices[sender.tag]
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
