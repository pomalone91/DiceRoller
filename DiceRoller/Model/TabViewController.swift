//
//  tabViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 6/6/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    // TODO - Add logic for saving/opening a users colorschemes so that it is persisted across app launches
    // Variables to pass between the views
    var colorScheme = ColorPalette()
    var rollLog: [Log] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.selectedIndex = 2
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
