//
//  ChallengeViewController.swift
//  Meeqo
//
//  Created by Viki on 2015. 05. 05..
//  Copyright (c) 2015. MyITSolver. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {
    var challenge : Challenge?

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var meeqoImage: UIImageView!
    @IBOutlet weak var difficulityChooser: UISegmentedControl!
    @IBOutlet weak var challengeTextLabel: UITextView!
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var challengeButton: UIButton!

    
    override func viewDidLoad() {
        self.view.sendSubviewToBack(background)
        completedButton.enabled = false
        difficulityChooser.enabled = true
        if self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular {
            meeqoImage.hidden = false
        }
        else {
            meeqoImage.hidden = true
            challengeTextLabel.font = UIFont(name: challengeTextLabel.font.fontName, size: 16)
        }
        challengeTextLabel.textAlignment = .Center
    }
    @IBAction func giveChallengeButtonTap(sender: UIButton) {
        if UserManager.didCompletedChallengeToday(){
            noMoreChallengeAlert()
        }
        else{
        
        completedButton.enabled = true
        challenge = ChallengeManager.getRandomChallenge()
        difficulityChooser.enabled = false
        if let c = challenge {
            c.level = Double(difficulityChooser.selectedSegmentIndex) + 1
            let labelCount = Int(Double(c.count)*c.level)
            challengeTextLabel.text =  "\(c.description as! String) \(labelCount) \(c.description2 as! String)"
        }
        
        }
    }
    
    @IBAction func completedButtonTap(sender: AnyObject) {
        meeqoImage.image = UIImage(named: "congrats")
        challenge!.completed = true
        UserManager.completedChallenge(challenge!)
        completedAlert()
    }
    
    func completedAlert(){
        let alert = UIAlertController(title: "Congratulations!", message: "You received \(Int(Double(challenge!.level) * Double(challenge!.coin))) coins!", preferredStyle: UIAlertControllerStyle.Alert)
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
}
    
    func noMoreChallengeAlert(){
        let alert = UIAlertController(title: "Try again tomorrow!", message: "You can only receive one challenge per day", preferredStyle: UIAlertControllerStyle.Alert)
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
   
}