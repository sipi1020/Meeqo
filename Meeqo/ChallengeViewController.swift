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
    
    @IBOutlet weak var rewardLabel: UILabel!
    @IBOutlet weak var meeqoImage: UIImageView!
    
    @IBOutlet weak var difficulityChooser: UISegmentedControl!
    @IBOutlet weak var challengeTextLabel: UITextView!
    @IBOutlet weak var completedButton: UIButton!
    
    
    override func viewDidLoad() {
        self.view.sendSubviewToBack(background)
        completedButton.enabled = false
        difficulityChooser.enabled = true
        rewardLabel.text = "Reward: " + String(Challenges.EASY_CHALLENGE_COIN)
        if self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular {
            meeqoImage.hidden = false
        }
        else {
            meeqoImage.hidden = true
            challengeTextLabel.font = UIFont(name: challengeTextLabel.font.fontName, size: 16)
        }

        
    }
    @IBAction func giveChallengeButtonTap(sender: UIButton) {
        completedButton.enabled = true
        challenge = ChallengeManager.getRandomChallenge()
        difficulityChooser.enabled = false
        if let c = challenge {
            challengeTextLabel.text = c.description as! String
            c.level = Double(difficulityChooser.selectedSegmentIndex) + 1
        }
        var button = sender as UIButton
        button.titleLabel?.text = "You can get only one challenge per day"
        button.enabled = false
        
    }
    
    @IBAction func completedButtonTap(sender: AnyObject) {
        meeqoImage.image = UIImage(named: "congrats")
        completedAlert()
    }
    
    
    @IBAction func difficulityChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0: rewardLabel.text = "Reward: " + String(Challenges.EASY_CHALLENGE_COIN)
        case 1: rewardLabel.text = "Reward: " + String(Challenges.MEDIUM_CHALLENGE_COIN)
        case 2: rewardLabel.text = "Reward: " + String(Challenges.HARD_CHALLENGE_COIN)
        
        default:
            break
        }
    }
    
    func completedAlert(){
        let alert = UIAlertController(title: "Congratulations!", message: "You received \(Int(Double(challenge!.level) * Double(challenge!.coin))) coins!", preferredStyle: UIAlertControllerStyle.Alert)
        var action = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
}
    
   
}