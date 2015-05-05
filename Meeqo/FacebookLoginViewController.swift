//
//  FacebookLoginViewController.swift
//  Meeqo
//
//  Created by Viki on 2015. 05. 05..
//  Copyright (c) 2015. MyITSolver. All rights reserved.
//

import UIKit

class FacebookLoginViewController: UIViewController {

    @IBAction func loginTap(sender: AnyObject) {
        println("Tapped")
        var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var VC = storyboard.instantiateViewControllerWithIdentifier("mainVC") as! MainViewController
        var navVC = UINavigationController(rootViewController: VC)
        self.presentViewController(navVC, animated: true, completion: nil)
        
    }
}
