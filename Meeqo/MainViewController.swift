//
//  ViewController.swift
//  Meeqo
//
//  Created by Viktoria Sipos on 4/11/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var meeqoRepo : MeeqoRepository!
    
    
    @IBOutlet var rooms: [UIImageView]!
    @IBOutlet weak var roomView: RoomView!
    
    /*override func viewWillAppear(animated: Bool) {
        removeMeeqoViews()
        loadMeeqosToRoom(roomView.currentRoom)
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //
        
        meeqoRepo = RepositoryFactory.getMeeqoRepository()
        createMeeqo("kek")
        
       
        /*var m = repo.getMeeqos()[0]
        m.position.x = 150
        m.updateMe()
        repo.remove(repo.getMeeqos()[0])
        println("You have \(repo.getMeeqos().count) Meeqos")
        
        let itemRepo = RepositoryFactory.getItemRepository()
        
        
        println("Repo: \(itemRepo.getInventory().weights)")
        itemRepo.getInventory().weights = true
        
        
        itemRepo.updateCurrentInventory()
        println("Repo: ball \(itemRepo.getInventory().ball)")
        
        UserManager.saveCurrentUserToTheServer()
        //itemRepo.getInventory().ball = true
        //itemRepo.updateCurrentInventory()
        
        */
        
        //createMeeqo("piros")
        
        
        
        removeMeeqoViews()
        loadMeeqosToRoom(roomView.currentRoom)
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        saveMeeqosPosition()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    roomView.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func adaptivePresentationStyleForPresentationController(
        controller: UIPresentationController) -> UIModalPresentationStyle {
            return .None
    }
    
    func loadMeeqosToRoom(roomNum: Int){
       var meeqos = meeqoRepo.getMeeqos()
        for meeqo in meeqos{
            if ( meeqo.position.roomNumber == roomNum){
                createMeeqoViewInPosition(Double(meeqo.position.x), y: Double(meeqo.position.y),color: meeqo.color,happiness: (Float(meeqo.entertainment) + Float(meeqo.food) + Float(meeqo.sleep))/3 ,id: meeqo.objectID)
                println("loading meeqos")
            }
        }
    }
    
    func saveMeeqosPosition(){
        var meeqos = meeqoRepo.getMeeqos()
        var subviews = self.view.subviews
        for view in subviews {
            if view is MeeqoView {
                var mView = view as! MeeqoView
                for meeqo in meeqos {
                    if meeqo.objectID == mView.meeqoID {
                        meeqo.position.x = mView.frame.origin.x
                        meeqo.position.y = mView.frame.origin.y
                        meeqo.updateMe()
                    }
                }
            }
        }
    }
    
    
    func createMeeqo(color: String){
        meeqoRepo.create(color)
        var meeqos = meeqoRepo.getMeeqos()
        //createMeeqoView(color,id:meeqos.last!.objectID
        meeqos.last?.position.x = self.view.frame.width/2
        meeqos.last?.position.y = self.view.frame.height/2 
        meeqos.last?.updateMe()
        saveMeeqosPosition()
        removeMeeqoViews()
        loadMeeqosToRoom(roomView.currentRoom)
        
    }
    
    func createMeeqoViewInPosition(x: Double, y: Double, color: String,happiness: Float, id: NSManagedObjectID){
        var newMeeqo: MeeqoView!
        if self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular  {
        newMeeqo = MeeqoView(frame: CGRect(x: x, y: y, width: 100, height: 100),color: color,happiness:happiness, id: id)
            println("regular")
        }
        else {
            newMeeqo = MeeqoView(frame: CGRect(x: x, y: y, width: 50, height: 50),color: color,happiness:happiness, id: id)
            println("compact")
        }
        newMeeqo.opaque = false
        self.view.addSubview(newMeeqo)
        var panGestureRecognizer = UIPanGestureRecognizer(target:self, action: "dragMeeqo:")
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectMeeqo:")
        newMeeqo.addGestureRecognizer(panGestureRecognizer)
        newMeeqo.addGestureRecognizer(tapGestureRecognizer)
        newMeeqo.userInteractionEnabled = true
    }
    
    
    func createMeeqoView(color: String,happiness: Float, id: NSManagedObjectID){
        var newMeeqo = MeeqoView(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2 + 100, width: 100, height: 100),color: color,happiness: happiness, id: id)
        newMeeqo.opaque = false
        self.view.addSubview(newMeeqo)
        var panGestureRecognizer = UIPanGestureRecognizer(target:self, action: "dragMeeqo:")
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectMeeqo:")
        newMeeqo.addGestureRecognizer(panGestureRecognizer)
        newMeeqo.addGestureRecognizer(tapGestureRecognizer)
        newMeeqo.userInteractionEnabled = true
        

    }
    
    func selectMeeqo(sender: UITapGestureRecognizer){
        var popoverContent = self.storyboard?.instantiateViewControllerWithIdentifier("StatusViewController") as! StatusViewController
        var meeqoView = sender.view as! MeeqoView
        popoverContent.meeqoID = meeqoView.meeqoID
        popoverContent.mainVC = self
        var nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.Popover
        var popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSizeMake(400,400)
        popover!.delegate = self
        popover!.sourceView = sender.view
        popover!.sourceRect = CGRectMake(0,0,10,10)
        self.presentViewController(nav, animated: true, completion: nil)
        
        
  
    }
    
    func prepareForPopoverPresentation(popoverPresentationController: UIPopoverPresentationController){
        
        
    }
    
    func removeMeeqoViews(){
        var subViews = self.view.subviews
        for view in subViews {
            if view is MeeqoView {
                view.removeFromSuperview()
            }
        }
    }
    
    func dragMeeqo(sender: UIPanGestureRecognizer){
        self.view.bringSubviewToFront(sender.view!)
        
        
        var translation = sender.translationInView(self.roomView)
        if sender.view!.center.y + translation.y >= roomView.frame.origin.y + sender.view!.frame.width/2 {
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.roomView)
        }
    }
    
    func meeqoToMeeqoView(meeqo: Meeqo) -> MeeqoView {
        var newMeeqo = MeeqoView(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2 + 100, width: 100, height: 100))
        newMeeqo.opaque = false
        
        var panGestureRecognizer = UIPanGestureRecognizer(target:self, action: "dragMeeqo:")
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectMeeqo:")
        newMeeqo.addGestureRecognizer(panGestureRecognizer)
        newMeeqo.addGestureRecognizer(tapGestureRecognizer)
        newMeeqo.userInteractionEnabled = true
        return newMeeqo
    }
    
    @IBAction func showDisco(sender: UITapGestureRecognizer) {
        saveMeeqosPosition()
        removeMeeqoViews()
        roomView.changeRoom(0)
        loadMeeqosToRoom(0)
       
    }
    @IBAction func showFitness(sender: UITapGestureRecognizer) {
        saveMeeqosPosition()
        removeMeeqoViews()
        roomView.changeRoom(1)
        loadMeeqosToRoom(1)
    }

    @IBAction func showPlay(sender: UITapGestureRecognizer) {
       saveMeeqosPosition()
        removeMeeqoViews()
        roomView.changeRoom(2)
        loadMeeqosToRoom(2)
    }
    
    @IBAction func showKitchen(sender: UITapGestureRecognizer) {
        saveMeeqosPosition()
        removeMeeqoViews()
        roomView.changeRoom(3)
        loadMeeqosToRoom(3)
    }

    @IBAction func showBedroom(sender: UITapGestureRecognizer) {
        saveMeeqosPosition()
        removeMeeqoViews()
        roomView.changeRoom(4)
        loadMeeqosToRoom(4)
    }
    


}

