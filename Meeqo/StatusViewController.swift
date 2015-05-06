//
//  StatusViewController.swift
//  Meeqo
//
//  Created by Viki on 2015. 04. 19..
//  Copyright (c) 2015. MyITSolver. All rights reserved.
//

import UIKit
import CoreData

class StatusViewController: UITableViewController {
    
    
    
    
    var meeqoID : NSManagedObjectID!
    var mainVC : MainViewController!
    var meeqoRepo : MeeqoRepository!

    @IBOutlet weak var happinessBar: UIProgressView!
    @IBOutlet weak var happinessIcon: UIImageView!
    
    @IBOutlet weak var foodBar: UIProgressView!
    @IBOutlet weak var entertainmentBar: UIProgressView!
    
    @IBOutlet weak var sleepBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular{
            self.tableView.rowHeight = 60
        }
        else{
            self.tableView.rowHeight = 40
        }
        
        meeqoRepo = MeeqoManager.meeqoRepo
        var meeqos = meeqoRepo.getMeeqos()
        for meeqo in meeqos {
            if meeqo.objectID == meeqoID {
                meeqo.food = 20
                meeqo.entertainment = 20
                meeqo.sleep = 20
                happinessBar.progress = ((Float(meeqo.entertainment) + Float(meeqo.food) + Float(meeqo.sleep))/3)/100
                foodBar.progress = Float(meeqo.food)/100
                sleepBar.progress = Float(meeqo.sleep)/100
                entertainmentBar.progress = Float(meeqo.entertainment)/100
            }
            
        }
        if happinessBar.progress < 33/100 {
            happinessIcon.image = UIImage(named: "sad_icon")
        }
        else if happinessBar.progress > 66/100 {
            happinessIcon.image = UIImage(named: "happy_icon")
        }
        else {
            happinessIcon.image = UIImage(named: "indifferent_icon")
        }

        
        
        
    
        print(meeqoID)
        print( " in statusvc")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if section == 0{
            return 1
        }
        else {
           return 4
        }
        
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var desinationVC = segue.destinationViewController as! increaseStatusViewController
        desinationVC.meeqoID = self.meeqoID
        if segue.identifier == "foodSegue" {
            desinationVC.tag = 0
            desinationVC.mainVC = self.mainVC
        }
        if segue.identifier == "playSegue" {
            desinationVC.tag = 1
            desinationVC.mainVC = self.mainVC
        }
        if segue.identifier == "sleepSegue" {
            desinationVC.tag = 2
            desinationVC.mainVC = self.mainVC
        }
        if segue.identifier == "moveSegue" {
            desinationVC.tag = 3
            desinationVC.mainVC = self.mainVC
        
        }
        
    }


}
