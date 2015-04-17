//
//  MeeqoView.swift
//  Meeqo
//
//  Created by Livvit on 17/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import UIKit

@IBDesignable
class MeeqoView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        var meeqoImage = UIImage(named: "meeqo")
        var meeqoImageView = UIImageView(frame: CGRect(x: frame.width / 8,y: frame.width / 4,width: frame.width / 4 * 3,height: frame.width / 4 * 3))
        meeqoImageView.image = meeqoImage
        var progressBar = UIProgressView(frame: CGRect(x: 0, y: frame.width / 16, width: frame.width, height: 50))
        progressBar.progress = 0.8
        progressBar.progressViewStyle = .Bar
        
        self.addSubview(meeqoImageView)
        self.addSubview(progressBar)
        
    }
    

}
