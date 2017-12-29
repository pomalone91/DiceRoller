//
//  LogViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 11/19/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    
    var rollLog: [String] = []
    
    @IBOutlet weak var logLabel: UILabel!
    
    func updateLog() {
        for item in rollLog {
            logLabel.text?.append(item)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rollLog)
        
        updateLog()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        rollLog.removeAll()
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
