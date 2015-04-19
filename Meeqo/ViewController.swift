//
//  ViewController.swift
//  Meeqo
//
//  Created by Viktoria Sipos on 4/11/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var rooms: [UIImageView]!
    
    
    @IBOutlet weak var roomView: RoomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        createMeeqo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createMeeqo(){
        var newMeeqo = MeeqoView(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2 + 100, width: 100, height: 100))
        newMeeqo.opaque = false
        
        self.view.addSubview(newMeeqo)
        var gestureRecognizer = UIPanGestureRecognizer(target:self, action: "dragMeeqo:")
        newMeeqo.addGestureRecognizer(gestureRecognizer)
        newMeeqo.userInteractionEnabled = true
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

