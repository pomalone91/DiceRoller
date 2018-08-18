//
//  GroupsViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 6/13/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var rollGroups: [RollGroup] = [RollGroup("Goblin"), RollGroup("Ghoul")]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rollGroups[0].addDie(with: 5, totalDice: 2, modifier: 1, name: "claws")
        rollGroups[0].addDie(with: 8, totalDice: 1, modifier: -5, name: "teeth")
        rollGroups[1].addDie(with: 4, totalDice: 100, modifier: 0, name: "sword")
        rollGroups[1].addDie(with: 6, totalDice: 10, modifier: 500, name: "spell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addGroupTapped(_ sender: Any) {
        // Create an AlertController that gets a string from the user
        let newGroupAlert = UIAlertController(title: "New Group", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        newGroupAlert.addTextField(configurationHandler: {UITextField in UITextField.placeholder = "Enter Group Name..."})
        let createAction = UIAlertAction(title: "Create", style: .default) { (alertAction) in
            // Get the textfields from newGroupAlert, check if that textfield has anything in it, then append it and reload table data if it does.
            guard let alertTextFields = newGroupAlert.textFields else { newGroupAlert.dismiss(animated: true, completion: nil); return }
            guard let rollGroupName = alertTextFields[0].text else { newGroupAlert.dismiss(animated: true, completion: nil);return }
            if rollGroupName == "" {
                newGroupAlert.dismiss(animated: true, completion: nil)
            } else {
                self.rollGroups.append(RollGroup(rollGroupName))
            }
            self.tableView.reloadData()
        }
        newGroupAlert.addAction(cancelAction)
        newGroupAlert.addAction(createAction)
        self.present(newGroupAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rollGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupTableViewCell
        
        // Get Roll Group
        let rollGroup = rollGroups[indexPath.row]
        
        // Configure Cell
        cell.update(with: rollGroup)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GroupSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let rollGroup = rollGroups[indexPath.row]
                let customDieController = segue.destination as! CustomDieViewController
                customDieController.rollGroup = rollGroup
            }
        }
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
