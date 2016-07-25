//
//  ShipsTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ismael Barry on 7/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ShipsTableViewController: UITableViewController {

    // Enables us to access our Datastore singleton:
    let store = DataStore.sharedDataStore
    
    var eachPirateShip : Set<Ship> = []
    
    var managedShipObjects: [Ship] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds our NSSet objects to our Messages array.
        for ships in eachPirateShip {
            
            managedShipObjects.append(ships)
            
        }
        
        self.store.fetchShipData()
        self.store.fetchPirateData()
        self.store.fetchEngineData()
        
        // Reloads the tableView
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.store.fetchShipData()
        self.store.fetchPirateData()
        self.store.fetchEngineData()
        
        // Reloads the tableView
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.managedShipObjects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("shipCell", forIndexPath: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = self.managedShipObjects[indexPath.row].name

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! ShipDetailViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow
        
        let eachShip = self.managedShipObjects[(indexPath?.row)!]
        
        if segue.identifier == "shipDetailSegue" {
            
            if let eachShipName = eachShip.name {
                
                destinationVC.eachShipName = eachShipName
            }
            
            if let eachPirateName = eachShip.pirates?.name {
                
                destinationVC.eachPirateName = eachPirateName
            }
            
            if let eachPropulsionType = eachShip.engines?.propulsion {
                
                destinationVC.eachPropulsionType = eachPropulsionType
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
