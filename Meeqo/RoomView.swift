//
//  RoomView.swift
//  Meeqo
//
//  Created by Livvit on 17/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import UIKit


class RoomView: UIView {
    
    var rooms : [UIImage]
    var discoItemImages : [UIImage]
    var fitnessItemImages : [UIImage]
    var playingroomItemImages : [UIImage]
    var kitchenItemImages : [UIImage]
    var bedroomItemImages : [UIImage]
    var currentRoom = 2
    var inventory : MeeqoInventory!
    
    override init(frame: CGRect) {
        self.rooms = [UIImage(named: "disco")!,UIImage(named: "fitnessroom")!,UIImage(named: "playingroom")!,UIImage(named: "kitchen")!,UIImage(named: "bedroom")! ]
        self.discoItemImages=[UIImage(named: "dancefloor")!,UIImage(named: "soundsystem")!]
        self.fitnessItemImages = [UIImage(named: "rope")!,UIImage(named: "treadmill")!,UIImage(named: "weight")!]
        self.playingroomItemImages = [UIImage(named: "ball")!,UIImage(named: "bear")!,UIImage(named: "trambulin")!,UIImage(named: "videogame")!]
        self.kitchenItemImages = [UIImage(named: "cake")!,UIImage(named: "icecream")!,UIImage(named: "lollipop")!]
        self.bedroomItemImages = [UIImage(named: "sleepingbear")!]
        self.inventory = ItemManager.getMeeqoInventory()
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        self.rooms = [UIImage(named: "disco")!,UIImage(named: "fitnessroom")!,UIImage(named: "playingroom")!,UIImage(named: "kitchen")!,UIImage(named: "bedroom")! ]
        self.discoItemImages=[UIImage(named: "dancefloor")!,UIImage(named: "soundsystem")!]
        self.fitnessItemImages = [UIImage(named: "rope")!,UIImage(named: "treadmill")!,UIImage(named: "weights")!]
        self.playingroomItemImages = [UIImage(named: "balls")!,UIImage(named: "bear")!,UIImage(named: "trambulin")!,UIImage(named: "videogame")!]
        self.kitchenItemImages = [UIImage(named: "cake")!,UIImage(named: "icecream")!,UIImage(named: "lollipop")!]
        self.bedroomItemImages = [UIImage(named: "sleepingbear")!]
        self.inventory = ItemManager.getMeeqoInventory()
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        var roomImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        roomImageView.image = rooms[currentRoom]
        roomImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(roomImageView)
        
        switch currentRoom{
        case 0:
            if (inventory.soundSystem as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = discoItemImages[1]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.danceFloor as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = discoItemImages[0]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
        case 1:
            if (inventory.treadmill as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = fitnessItemImages[1]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.weights as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = fitnessItemImages[2]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.rope as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = fitnessItemImages[0]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
        case 2:
            if (inventory.trambulin as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = playingroomItemImages[2]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.ball as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = playingroomItemImages[0]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.videoGame as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = playingroomItemImages[3]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.bear as Bool) {
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = playingroomItemImages[1]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
        case 3:
            if (inventory.cake as Int) > 0{
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = kitchenItemImages[0]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.lollipop as Int) > 0{
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = kitchenItemImages[2]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
            if (inventory.icecream as Int) > 0{
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = kitchenItemImages[1]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
        case 4:
            if (inventory.sleepingBear as Bool){
                var toyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
                toyImageView.image = bedroomItemImages[0]
                toyImageView.contentMode = UIViewContentMode.ScaleAspectFill
                self.addSubview(toyImageView)
            }
          
        default:
            println("default case")
            
        }
        
    }
    
    func changeRoom(roomNumber : Int) {
        if roomNumber < 5 && roomNumber >= 0 {
            currentRoom = roomNumber
            setNeedsDisplay()
        }
    }
    
    

}
