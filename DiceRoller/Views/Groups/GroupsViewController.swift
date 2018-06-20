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
            // TODO - handle the optionals in this better
            self.rollGroups.append(RollGroup(newGroupAlert.textFields![0].text!))
            self.tableView.reloadData()
        }
        newGroupAlert.addAction(cancelAction)
        newGroupAlert.addAction(createAction)
        self.present(newGroupAlert, animated: true, completion: nil)
        // Use that string to create a RollGroup object
        // Append that RollGroup object to rollGroups
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
