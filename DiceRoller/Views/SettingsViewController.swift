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
    // chosen color to pass in segue
    var chosenColor = ColorPalette()
    
    @IBOutlet var themeButtons: [UIButton]!
    @IBOutlet weak var titleLabel: UILabel!
    
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
        setupStyle()
        let tabBar = tabBarController as! TabViewController
        tabBar.colorScheme = chosenColor
    }
    
    // Function to load color scheme for settings
    func setupStyle() {
        view.backgroundColor = chosenColor.backGroundColor
        for button in themeButtons {
            button.backgroundColor = chosenColor.rollColor
            button.layer.cornerRadius = 15
            button.setTitleColor(chosenColor.textColor, for: .normal)
            // Set up for dynamic type text
            button.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        }
        navigationController?.navigationBar.barTintColor = chosenColor.backGroundColor
        navigationController?.navigationBar.tintColor = chosenColor.textColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : chosenColor.textColor]
        titleLabel.textColor = chosenColor.textColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
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
