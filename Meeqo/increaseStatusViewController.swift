//
//  increaseStatusViewController.swift
//  Meeqo
//
//  Created by Viki on 2015. 04. 22..
//  Copyright (c) 2015. MyITSolver. All rights reserved.
//

import UIKit
import CoreData

class increaseStatusViewController: UITableViewController,UITableViewDelegate {
    
    var tag : Int = 0
    var foodImages = [UIImage]()
    var toyImages = [UIImage]()
    var roomImages = [UIImage]()
    let roomNames = ["Disco","Fitness room","Playing room","Kitchen","Bedroom"]
    var foodOrToyImageView : UIImageView!
    var roomImageView : UIImageView!
    var foodOrToyNameLabel : UILabel!
    var roomNameLabel : UILabel!
    var foodOrToyCountLabel : UILabel!
    var meeqoID : NSManagedObjectID!
    var mainVC : MainViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        roomImages = [UIImage(named: "discoFull")!,UIImage(named: "fitnessroomFull")!,UIImage(named: "playingroomFull")!,UIImage(named: "kitchenFull")!,UIImage(named: "bedroomFull")! ]
        for i in 0...3{
            foodImages.append(UIImage(named: "food_icon")!)
        }
        for i in 0...8{
            toyImages.append(UIImage(named: "play_icon")!)
        }
        println(tag)
        
        RepositoryFactory.getMeeqoRepository().create("kek")
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        switch tag{
        case 0: return 3
        case 1: return 9
        case 2: return 1
        case 3: return 5
        default : return 9
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*var cell = tableView.dequeueReusableCellWithIdentifier("foodAndPlayCell", forIndexPath: indexPath) as! UITableViewCell*/
        
        /*foodOrToyImageView = view.viewWithTag(1) as! UIImageView
        foodOrToyNameLabel = view.viewWithTag(2) as! UILabel
        foodOrToyNameLabel = view.viewWithTag(3) as! UILabel
        foodOrToyImageView.image = foodImages[indexPath.row]*/
        
        switch tag{
        case 0:
         var cell = tableView.dequeueReusableCellWithIdentifier("foodAndPlayCell", forIndexPath: indexPath) as! UITableViewCell
            foodOrToyImageView = view.viewWithTag(1) as! UIImageView
            foodOrToyNameLabel = view.viewWithTag(2) as! UILabel
            foodOrToyCountLabel = view.viewWithTag(3) as! UILabel
            foodOrToyImageView.image = foodImages[indexPath.row]
            cell.selectionStyle = .None
            return cell
            
        case 1:
            var cell = tableView.dequeueReusableCellWithIdentifier("foodAndPlayCell", forIndexPath: indexPath) as! UITableViewCell
            foodOrToyImageView = view.viewWithTag(1) as! UIImageView
            foodOrToyNameLabel = view.viewWithTag(2) as! UILabel
            foodOrToyCountLabel = view.viewWithTag(3) as! UILabel
            foodOrToyImageView.image = toyImages[indexPath.row]
            cell.selectionStyle = .None
            return cell
        case 2:
            var cell = tableView.dequeueReusableCellWithIdentifier("sleepCell", forIndexPath: indexPath) as! UITableViewCell
            cell.selectionStyle = .None
            return cell
            
        case 3:
            var cell = tableView.dequeueReusableCellWithIdentifier("moveCell", forIndexPath: indexPath) as! UITableViewCell
            roomImageView = view.viewWithTag(4) as! UIImageView
            roomNameLabel = view.viewWithTag(5) as! UILabel
            roomImageView.image = roomImages[indexPath.row]
            roomNameLabel.text = roomNames[indexPath.row]
            return cell
        default:
            var cell = tableView.dequeueReusableCellWithIdentifier("foodAndPlayCell", forIndexPath: indexPath) as! UITableViewCell
            cell.selectionStyle = .None
            return cell
        }
        // Configure the cell...
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if tag == 3 {
            var meeqoRepo = RepositoryFactory.getMeeqoRepository()
            var meeqos = meeqoRepo.getMeeqos()
            for meeqo in meeqos {
                if meeqo.objectID == meeqoID {
                    meeqo.position.roomNumber = indexPath.row
                }
            }
            var navVC = self.navigationController
            navVC?.dismissViewControllerAnimated(false, completion: nil)
            mainVC.removeMeeqoViews()
            mainVC.roomView.changeRoom(indexPath.row)
            mainVC.loadMeeqosToRoom(mainVC.roomView.currentRoom)
        }
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
