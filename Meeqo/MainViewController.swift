//
//  ViewController.swift
//  Meeqo
//
//  Created by Viktoria Sipos on 4/11/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
    @IBOutlet var rooms: [UIImageView]!
    
    
    @IBOutlet weak var roomView: RoomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        createMeeqo()
        createMeeqo()
        createMeeqo()
        createMeeqo()
        
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
    
    func createMeeqo(){
        var newMeeqo = MeeqoView(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2 + 100, width: 100, height: 100))
        newMeeqo.opaque = false
        
        self.view.addSubview(newMeeqo)
        var panGestureRecognizer = UIPanGestureRecognizer(target:self, action: "dragMeeqo:")
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectMeeqo:")
        newMeeqo.addGestureRecognizer(panGestureRecognizer)
        newMeeqo.addGestureRecognizer(tapGestureRecognizer)
        newMeeqo.userInteractionEnabled = true
    }
    
    func selectMeeqo(sender: UITapGestureRecognizer){
        /*var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var statusViewController = storyboard.instantiateViewControllerWithIdentifier("StatusViewController") as! StatusViewController
        var segue = UIStoryboardPopoverSegue(identifier: "showStatusSegue", source: self, destination: statusViewController)
        
        performSegueWithIdentifier("showStatusSegue", sender: self)*/
        
        
        var popoverContent = self.storyboard?.instantiateViewControllerWithIdentifier("StatusViewController") as! UIViewController
        var nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.Popover
        var popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSizeMake(400,400)
        popover!.delegate = self
        popover!.sourceView = sender.view
        popover!.sourceRect = CGRectMake(0,0,10,10)
        
        self.presentViewController(nav, animated: true, completion: nil)
        
        
        /*var navigationController = self.navigationController
        var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var statusViewController = storyboard.instantiateViewControllerWithIdentifier("StatusViewController") as! StatusViewController
        statusViewController.modalPresentationStyle = .Popover
        statusViewController.preferredContentSize = CGSizeMake(400, 400)
        
        let popoverStatusViewController = statusViewController.popoverPresentationController
        popoverPresentationController?.permittedArrowDirections = .Any
        popoverPresentationController?.delegate = self
        popoverPresentationController?.sourceView = sender.view
        popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: sender.view!.frame.width, height: sender.view!.frame.height)
        if sender.state == .Ended{ presentViewController(statusViewController, animated: true, completion: nil)
        }*/
        
        
        //navigationController?.presentViewController(statusViewController, animated: true, completion: nil)
    }
    
    func prepareForPopoverPresentation(popoverPresentationController: UIPopoverPresentationController){
        
    }
    
    func dragMeeqo(sender: UIPanGestureRecognizer){
        self.view.bringSubviewToFront(sender.view!)
        
        
        var translation = sender.translationInView(self.roomView)
        if sender.view!.center.y + translation.y >= roomView.frame.origin.y + sender.view!.frame.width/2 {
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.roomView)
        }
    }
    
    
    @IBAction func showDisco(sender: UITapGestureRecognizer) {
        roomView.changeRoom(0)
       
    }
    @IBAction func showFitness(sender: UITapGestureRecognizer) {
        roomView.changeRoom(1)
    }

    @IBAction func showPlay(sender: UITapGestureRecognizer) {
        roomView.changeRoom(2)
    }
    
    @IBAction func showKitchen(sender: UITapGestureRecognizer) {
        roomView.changeRoom(3)
    }

    @IBAction func showBedroom(sender: UITapGestureRecognizer) {
        roomView.changeRoom(4)
    }
    

}

