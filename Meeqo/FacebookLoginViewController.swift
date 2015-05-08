//
//  FacebookLoginViewController.swift
//  Meeqo
//
//  Created by Viki on 2015. 05. 05..
//  Copyright (c) 2015. MyITSolver. All rights reserved.
//

import UIKit

class FacebookLoginViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var fbLoginView: FBLoginView!
    
    @IBOutlet weak var background: UIImageView!
    @IBAction func loginTap(sender: AnyObject) {
        println("Tapped")
        var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var VC = storyboard.instantiateViewControllerWithIdentifier("mainVC") as! MainViewController
        var navVC = UINavigationController(rootViewController: VC)
        self.presentViewController(navVC, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email"]
        self.view.sendSubviewToBack(background)
        
    }
    func sessionStateChanged(session:FBSession, state:FBSessionState, error:NSError?) {
        println("1234")
    }
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as! String
        println("User Email: \(userEmail)")
        
        let dbUser = UserManager.getCurrentUser()
        dbUser.name = user.first_name
        dbUser.facebookID = user.objectID
        
        let userRepo = RepositoryFactory.getUserRepository()
        userRepo.setParamsOfUser(user.first_name, facebookId: user.objectID)
        
        //open vc
        var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        var VC = storyboard.instantiateViewControllerWithIdentifier("mainVC") as! MainViewController
        var navVC = UINavigationController(rootViewController: VC)
        self.presentViewController(navVC, animated: true, completion: nil)
        
        //User.id = user.objectID
        //User.name = user.first_name
        
        //let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("InitialViewController") as! InitialViewController
        
        //self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
