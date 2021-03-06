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
    var thisMeeqo : Meeqo!
    var statusVC: StatusViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        roomImages = [UIImage(named: "discoFull")!,UIImage(named: "fitnessroomFull")!,UIImage(named: "playingroomFull")!,UIImage(named: "kitchenFull")!,UIImage(named: "bedroomFull")! ]
        foodImages = ItemManager.getFoodIcons()
        toyImages = ItemManager.getToyIcons()
        println(tag)
        
        var meeqos = MeeqoManager.getMeeqos()
        for meeqo in meeqos {
            if meeqo.objectID == meeqoID {
                self.thisMeeqo = meeqo
            }
            
        }
        
        
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
            foodOrToyNameLabel.text = ItemManager.getFoodTitles()[indexPath.row]
            foodOrToyCountLabel.text = ("\(ItemManager.getFoodCount()[indexPath.row]) X")
         var eatButton = view.viewWithTag(4) as! UIButton
         eatButton.addTarget(self, action: "eatTap:", forControlEvents: UIControlEvents.TouchUpInside)
            cell.selectionStyle = .None
            return cell
            
        case 1:
            var cell = tableView.dequeueReusableCellWithIdentifier("foodAndPlayCell", forIndexPath: indexPath) as! UITableViewCell
            foodOrToyImageView = view.viewWithTag(1) as! UIImageView
            foodOrToyNameLabel = view.viewWithTag(2) as! UILabel
            foodOrToyCountLabel = view.viewWithTag(3) as! UILabel
            foodOrToyImageView.image = toyImages[indexPath.row]
            foodOrToyNameLabel.text = ItemManager.getToyTitles()[indexPath.row]
            if ItemManager.getToyState()[indexPath.row] {
                foodOrToyCountLabel.text = "✓"
            }
            else {
                foodOrToyCountLabel.text = "x"
            }
            var playButton = view.viewWithTag(4) as! UIButton
            playButton.addTarget(self, action: "playTap:", forControlEvents: UIControlEvents.TouchUpInside)
            cell.selectionStyle = .None
            return cell
        case 2:
            var cell = tableView.dequeueReusableCellWithIdentifier("sleepCell", forIndexPath: indexPath) as! UITableViewCell
            var sleepButton = view.viewWithTag(6) as! UIButton
            sleepButton.addTarget(self, action:
                "sleepTap:", forControlEvents: UIControlEvents.TouchUpInside)
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
    
    
    func eatTap( sender: UIButton){
        refreshBars()
        var cell = sender.superview?.superview as! UITableViewCell
        var table = cell.superview?.superview as! UITableView
        var indexPath = table.indexPathForCell(cell)
        var foodCountLabel = cell.viewWithTag(3) as! UILabel!
        mainVC.roomView.setNeedsDisplay()
        
        switch indexPath!.row{
        case 0:
            if !MeeqoManager.eatMeeqo(thisMeeqo, foodValue: ItemData.LOLLIPOP_FOOD_VALUE){
                notEnoughFoodAlert()
            }
            else {
                ateFoodAlert()
            }
            
        case 1:
            if !MeeqoManager.eatMeeqo(thisMeeqo, foodValue: ItemData.ICECREAM_FOOD_VALUE){
                notEnoughFoodAlert()
            }
            else {
                ateFoodAlert()
            }
        case 2:
            if !MeeqoManager.eatMeeqo(thisMeeqo, foodValue: ItemData.CAKE_FOOD_VALUE){
                notEnoughFoodAlert()
            }
            else {
                ateFoodAlert()
            }
        default:
            break
        }
        
        mainVC.removeMeeqoViews()
        mainVC.loadMeeqosToRoom(mainVC.roomView.currentRoom)
        thisMeeqo.updateMe()
        self.tableView.reloadData()
    }
    
    func playTap( sender: UIButton){
        refreshBars()
        var cell = sender.superview?.superview as! UITableViewCell
        var table = cell.superview?.superview as! UITableView
        var indexPath = table.indexPathForCell(cell)
        switch indexPath!.row{
        case 0:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.BALL_FOOD_VALUE){
                playedAlert()
                
            }
            else {
                noToyAlert()
            }
        case 1:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.ROPE_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 2:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.WEIGHTS_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 3:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.BEAR_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 4:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.SLEEPING_BEAR_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 5:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.TRAMBULIN_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 6:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.SOUND_SYSTEM_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 7:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.TREADMILL_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 8:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.DANCE_FLOOR_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
        case 9:
            if MeeqoManager.playMeeqo(thisMeeqo, playValue: ItemData.VIDEO_GAMES_FOOD_VALUE){
                playedAlert()
            }
            else {
                noToyAlert()
            }
                default:
            break
        }
        mainVC.removeMeeqoViews()
        mainVC.loadMeeqosToRoom(mainVC.roomView.currentRoom)
        self.tableView.reloadData()
        thisMeeqo.updateMe()
        
    }
    func sleepTap( sender: UIButton){
        refreshBars()
        var cell = sender.superview?.superview as! UITableViewCell
        var table = cell.superview?.superview as! UITableView
        var indexPath = table.indexPathForCell(cell)
        switch indexPath!.row{
        case 0:
            MeeqoManager.sleepMeeqo(thisMeeqo)
        default:
            break
        }
        sleptAlert()
        mainVC.removeMeeqoViews()
        mainVC.loadMeeqosToRoom(mainVC.roomView.currentRoom)

        thisMeeqo.updateMe()
    }
    
    func notEnoughFoodAlert(){
        var alert = UIAlertController(title:"No food!" , message: "You don't have even one piece of this type of food. Visit the shop! ", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    func noToyAlert(){
        var alert = UIAlertController(title:"I can't play!" , message: "I really-really want to play, but you haven't bought this item", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func ateFoodAlert(){
        var alert = UIAlertController(title:"Yummy" , message: "Hunger: \(thisMeeqo.food) %", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }

    func playedAlert(){
        var alert = UIAlertController(title:"That was fun!" , message: "Entertainment: \(thisMeeqo.entertainment) %", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    func sleptAlert(){
        var alert = UIAlertController(title:"Zzz..." , message: "Sleep: \(thisMeeqo.sleep) %", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
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
    
    func refreshBars(){
        statusVC.foodBar.setNeedsDisplay()
        statusVC.sleepBar.setNeedsDisplay()
        statusVC.entertainmentBar.setNeedsDisplay()
        statusVC.happinessBar.setNeedsDisplay()
    }

}
