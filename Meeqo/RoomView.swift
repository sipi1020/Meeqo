//
//  RoomView.swift
//  Meeqo
//
//  Created by Livvit on 17/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import UIKit

@IBDesignable
class RoomView: UIView {
    
    var rooms : [UIImage]
    var house : UIImage
    var currentRoom = 2
    
    override init(frame: CGRect) {
        self.rooms = [UIImage(named: "disco")!,UIImage(named: "fitnessroom")!,UIImage(named: "playingroom")!,UIImage(named: "kitchen")!,UIImage(named: "bedroom")! ]
        self.house = UIImage(named: "house")!
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        self.rooms = [UIImage(named: "disco")!,UIImage(named: "fitnessroom")!,UIImage(named: "playingroom")!,UIImage(named: "kitchen")!,UIImage(named: "bedroom")! ]
        self.house = UIImage(named: "house")!
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        var roomImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        roomImageView.image = rooms[currentRoom]
        self.addSubview(roomImageView)
        
    }
    
    func goUp() {
        if currentRoom < 5 {
            currentRoom++
            setNeedsDisplay()
        }
    }
    func goDown() {
        if currentRoom > 0 {
            currentRoom--
            setNeedsDisplay()
        }
    }
    

}
