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
        var coinButton = UIBarButtonItem(title:"coins" , style: UIBarButtonItemStyle.Plain, target:self , action: "getCoinsAlert")
        coinButton.enabled = true
        coinButton.tintColor = UIColor.blackColor()
        coinButton.title = ("\(UserManager.getCurrentUser().coins) coins")
        self.navigationItem.rightBarButtonItem = coinButton
        println("\(UserManager.getCurrentUser().coins) coins")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    func refreshMoneyLabel(){
        self.navigationItem.rightBarButtonItem?.title = ("\(Int(UserManager.getCurrentUser().coins)) coins")
        println((UserManager.getCurrentUser().coins))
    }
    
    func getCoinsAlert(){
        var alert = UIAlertController(title:"You need more money?" , message: "Complete challenges to get more money!", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
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
        var count = cell.viewWithTag(5) as! UILabel
        

        switch indexPath.section{
        case 0:
            imageView.image = ItemManager.getFoodIcons()[indexPath.row]
            title.text = ItemManager.getFoodTitles()[indexPath.row]
            info.text = "\(ItemManager.getFoodPrices()[indexPath.row]) coins"
            if ItemManager.getFoodCount()[indexPath.row] > 1{
            count.text = "\(ItemManager.getFoodCount()[indexPath.row]) pieces"
            }
            else{
            count.text = "\(ItemManager.getFoodCount()[indexPath.row]) piece"
            }
            button.addTarget(self, action: "buyFood:", forControlEvents: UIControlEvents.TouchUpInside)
        case 1:
            imageView.image = ItemManager.getToyIcons()[indexPath.row]
            title.text = ItemManager.getToyTitles()[indexPath.row]
            info.text = "\(self.toyStatesString()[indexPath.row])"
            count.text = ""
            button.addTarget(self, action: "buyToy:", forControlEvents: UIControlEvents.TouchUpInside)
        case 2:
            imageView.image = MeeqoManager.getMeeqoIcons()[indexPath.row]
            title.text = MeeqoManager.getMeeqoTitles()[indexPath.row]
            info.text = "\(MeeqoManager.getMeeqoPrices()[indexPath.row]) coins"
            count.text = ""
            button.addTarget(self, action: "buyMeeqo:", forControlEvents: UIControlEvents.TouchUpInside)
        default:
            break
        }

        return cell
    }
    
    func buyFood(sender: UIButton){
        var cell = sender.superview?.superview as! UITableViewCell
        var table = cell.superview?.superview as! UITableView
        var indexPath = table.indexPathForCell(cell)
        if indexPath?.section == 0{
        println(ItemManager.getFoodTitles()[indexPath!.row])
            switch indexPath!.row {
            case 0:
                if !ItemManager.buyLollipop(){
                    notEnoughMoneyAlert()
                }
                println("\(ItemManager.getMeeqoInventory().lollipop)")
            case 1:
                if !ItemManager.buyIceCream(){
                    notEnoughMoneyAlert()
                }
                println("\(ItemManager.getMeeqoInventory().icecream)")
            case 2:
                if !ItemManager.buyCake(){
                    notEnoughMoneyAlert()
                }
                println("\(ItemManager.getMeeqoInventory().cake)")
            default:
                break
            }
        }
         self.tableView.reloadData()
        refreshMoneyLabel()
    }
    
    
    func buyToy(sender: UIButton){
        var cell = sender.superview?.superview as! UITableViewCell
        var table = cell.superview?.superview as! UITableView
        var indexPath = table.indexPathForCell(cell)
        if indexPath?.section == 1{
        println(ItemManager.getToyTitles()[indexPath!.row])
            switch indexPath!.row {
            case 0:
                if ItemManager.buyBall(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().ball as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 1:
                if ItemManager.buyRope(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().rope as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 2:
                if ItemManager.buyWeights(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().weights as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 3:
                if ItemManager.buyBear(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().bear as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 4:
                if ItemManager.buySleepingBear(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().sleepingBear as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 5:
                if ItemManager.buyTrambulin(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().trambulin as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 6:
                if ItemManager.buySoundSystem(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().soundSystem as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 7:
                if ItemManager.buyTreadmill(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().treadmill as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 8:
                if ItemManager.buyDanceFloor(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().danceFloor as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            case 9:
                if ItemManager.buyVideoGames(){
                    purchasedToyAlert()
                }
                else {
                    if (ItemManager.getMeeqoInventory().videoGame as Bool){
                        alreadyPurchasedAlert()
                    }
                    else{
                        notEnoughMoneyAlert()
                    }
                }
            default:
                break
            }
        }
       
        self.tableView.reloadData()
        refreshMoneyLabel()
    }
    
    func buyMeeqo(sender: UIButton){
        var cell = sender.superview?.superview as! UITableViewCell
        var table = cell.superview?.superview as! UITableView
        var indexPath = table.indexPathForCell(cell)
        if indexPath?.section == 2{
        println(MeeqoManager.getMeeqoTitles()[indexPath!.row])
            switch indexPath!.row {
            case 0:
                if MeeqoManager.buyMeeqo("narancs"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            case 1:
                if MeeqoManager.buyMeeqo("lila"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            case 2:
                if MeeqoManager.buyMeeqo("rozsaszin"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            case 3:
                if MeeqoManager.buyMeeqo("zold"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            case 4:
                if MeeqoManager.buyMeeqo("kek"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            case 5:
                if MeeqoManager.buyMeeqo("fekete"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            case 6:
                if MeeqoManager.buyMeeqo("piros"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            case 7:
                if MeeqoManager.buyMeeqo("szivarvany"){
                    purchasedToyAlert()
                }
                else {
                    notEnoughMoneyAlert()
                }
            default:
                break
            }
        }
         self.tableView.reloadData()
        refreshMoneyLabel()
    }
    
    func notEnoughMoneyAlert(){
        var alert = UIAlertController(title:"Ops" , message: "You don't have enough money to buy this item. ", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func alreadyPurchasedAlert(){
        var alert = UIAlertController(title:"Ops" , message: "You have already purchased this item. ", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func purchasedMeeqoAlert(){
        var alert = UIAlertController(title:"Congratulations!" , message: "You succesfully bought a new Meeqo. Take good care of it! ", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    func purchasedToyAlert(){
        var alert = UIAlertController(title:"Great" , message: "You succesfully purchased this item. Your Meeqos will love it! ", preferredStyle:UIAlertControllerStyle.Alert )
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
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
