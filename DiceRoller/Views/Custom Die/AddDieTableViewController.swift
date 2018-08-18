//
//  AddDieTableViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 6/29/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import UIKit

class AddDieTableViewController: UITableViewController {
    
    var die: Die?

    @IBOutlet weak var dieNameTextField: UITextField!
    @IBOutlet weak var sidesTextField: UITextField!
    @IBOutlet weak var numberOfDiceTextField: UITextField!
    @IBOutlet weak var modifierLabel: UITextField!
    @IBOutlet weak var modifierStepper: UIStepper!
    
    @IBAction func modifierTapped(_ sender: Any) {
        print("modifier tapped")
        modifierLabel.text = "\(modifierStepper.value)"
    }
    @IBAction func doneTapped(_ sender: Any) {
        performSegue(withIdentifier: "saveUnwind", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Unwrap the optional die if this was segued to from the edit button
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        
        // Make the die to be sent over
        // Need to add name property to Die type
        let name = dieNameTextField.text ?? ""
        let sides = Int(sidesTextField.text!) ?? 0
        let numberOfDice = Int(numberOfDiceTextField.text!) ?? 0
        let modifier = Int(modifierStepper.value)
        
        die = Die(sides: sides, totalDice: numberOfDice, modifier: modifier, name: name)
        
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
