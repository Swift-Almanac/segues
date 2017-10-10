//
//  MyTableViewController.swift
//  segues
//
//  Created by Mark Hoath on 10/10/17.
//  Copyright © 2017 Mark Hoath. All rights reserved.
//

import UIKit

let kReUse = "MyCell"

let kAddSeque = "Add"
let kEditSegue = "Edit"
let kUnwind = "unwindToTable"

class MyTableViewController: UITableViewController {
    
    var array: [String] = ["Cell 1", "Cell 2", "Cell 3", "Cell 4", "Cell 5", "Cell 6", "Cell 7", "Cell 8" ]
    var selectedCell : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kReUse, for: indexPath) as! MyTableViewCell

        cell.myCellLabel.text = array[indexPath.row]
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let indexPath = tableView.indexPathForSelectedRow
        let destVC = segue.destination as! MyViewController
        
        if segue.identifier == kAddSeque {
            destVC.cellLabel = ""
            // Add a Record
        }
        else if segue.identifier == kEditSegue {
            destVC.cellLabel = array[(indexPath?.row)!]
            array[(indexPath?.row)!] = ""
            tableView.reloadData()
            selectedCell = (indexPath?.row)!
            // Edit a Record
        } else {
            print ("Somethings Wrongs")
        }
    
    }
    
    @IBAction func unWindToTableView(for unwindSegue: UIStoryboardSegue) {
        
        let sourceVC = unwindSegue.source as! MyViewController
        
        if sourceVC.cellLabel != "" {
            array[selectedCell] = sourceVC.cellLabel
            tableView.reloadData()
        }
    }
    

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
    @IBAction func addAction(_ sender: UIBarButtonItem) {
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
