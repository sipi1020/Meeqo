//
//  MeeqoView.swift
//  Meeqo
//
//  Created by Livvit on 17/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import UIKit
import CoreData


class MeeqoView: UIView {
    var meeqoID : NSManagedObjectID!
    var color : String!
    var happiness :Float!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, color: String,happiness: Float, id: NSManagedObjectID) {
        self.color = color
        self.meeqoID = id
        self.happiness = happiness
        super.init(frame: frame)
    
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during mation.
    override func drawRect(rect: CGRect) {
        var meeqoImage : UIImage
        if(color == nil){
        meeqoImage = UIImage(named: "szivarvany")!
        }
        else{
          meeqoImage = UIImage(named: color)!
        }
        
        var meeqoImageView = UIImageView(frame: CGRect(x: frame.width / 10 ,y: frame.width / 6 ,width: frame.width / 10 * 8,height: frame.width / 10 * 8))
        
        meeqoImageView.image = meeqoImage
        var progressBar = UIProgressView(frame: CGRect(x: frame.width / 10, y: frame.width / 16, width: frame.width / 10 * 8, height: 50))
        progressBar.progress = self.happiness / 100
        progressBar.progressViewStyle = .Bar
        
        
        self.addSubview(meeqoImageView)
        self.addSubview(progressBar)
        
    }
    

}
