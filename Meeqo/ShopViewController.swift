//
//  ShopViewController.swift
//  Meeqo
//
//  Created by Viki on 2015. 04. 30..
//  Copyright (c) 2015. MyITSolver. All rights reserved.
//

import UIKit

class ShopViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func toyStatesString() ->[String]{
        var toyStates = [String]()
        for var i = 0 ; i < ItemManager.getToyState().count; i++ {
            if(ItemManager.getToyState()[i]) == false {
                toyStates.append("\(ItemManager.getToyPrices()[i]) coins")
            }
            else {
                toyStates.append("PURCHASED")
            }
        }
        return toyStates
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        switch section {
        case 0:
            return ItemManager.getFoodTitles().count
        case 1:
            return ItemManager.getToyTitles().count
        case 2:
            return MeeqoManager.getMeeqoTitles().count
        default:
            break
            
        }
        
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("shopCell", forIndexPath: indexPath) as! UITableViewCell
        var imageView = cell.viewWithTag(1) as! UIImageView
        var title = cell.viewWithTag(2) as! UILabel
        var info = cell.viewWithTag(3) as! UILabel
        var button = cell.viewWithTag(4) as! UIButton

        switch indexPath.section{
        case 0:
            imageView.image = ItemManager.getFoodIcons()[indexPath.row]
            title.text = ItemManager.getFoodTitles()[indexPath.row]
            info.text = "\(ItemManager.getFoodPrices()[indexPath.row]) coins"
        case 1:
            imageView.image = ItemManager.getToyIcons()[indexPath.row]
            title.text = ItemManager.getToyTitles()[indexPath.row]
            info.text = "\(self.toyStatesString()[indexPath.row])"
        case 2:
            imageView.image = MeeqoManager.getMeeqoIcons()[indexPath.row]
            title.text = MeeqoManager.getMeeqoTitles()[indexPath.row]
            info.text = "\(MeeqoManager.getMeeqoPrices()[indexPath.row]) coins"
        default:
            break
        }

        return cell
    }
    
    override func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int)
        -> String {
            switch section{
            case 0:
                return "Food"
            case 1:
                return "Toys"
            case 2:
                return "Meeqos"
            default :
                return ""
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
