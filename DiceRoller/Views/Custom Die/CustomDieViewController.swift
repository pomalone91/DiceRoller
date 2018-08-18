//
//  CustomDieViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 6/22/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import UIKit

class CustomDieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var rollGroup: RollGroup?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (rollGroup?.rolls.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return rollGroup?.rolls[section].name
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let numberOfDice = rollGroup?.rolls.count else { return 0 }
//        return numberOfDice
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dieCell", for: indexPath) as! CustomDieTableViewCell
        // Get die
        let die = self.rollGroup?.rolls[indexPath.section]
//        let die = rollGroup?.rolls[indexPath.row]
        cell.update(with: die!)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let rolls = rollGroup {
            print(rolls.groupName)
            print(rolls.rolls)
        }
        // Set the delegate and data source for the tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("rolls in this group...")
        for die in (rollGroup?.rolls)! {
            print(die)
        }
        self.tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
        print("view did appear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToCustomDieViewController(_ sender: UIStoryboardSegue) {
        let sourceViewController = sender.source as! AddDieTableViewController
        
        // Get the die
        if let die = sourceViewController.die {
            rollGroup?.rolls.append(die)
            tableView.beginUpdates()
            self.tableView.reloadData()
            
//            let newIndexPath = IndexPath(row: (rollGroup?.rolls.count)!, section: tableView.numberOfSections)
//            let sectionToReload = IndexSet.init(integer: tableView.numberOfSections)
//            tableView.reloadSections(IndexSet(integersIn: 0...tableView.numberOfSections), with: .none)
//            tableView.insertRows(at: [newIndexPath], with: .none)
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
