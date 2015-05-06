//
//  UserManager.swift
//  Meeqo
//
//  Created by Livvit on 26/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import UIKit

class UserManager {
    static let userRepo = RepositoryFactory.getUserRepository()
    static let itemRepo = RepositoryFactory.getItemRepository()
    static let meeqoRepo = RepositoryFactory.getMeeqoRepository()
    
    static var urlSession: NSURLSession!
    
    static func completedChallengeToday() -> Bool {
        let user = userRepo.getUser()
        var completed = false
        
        //TODO implement method
        return completed
    }
    static func downloadUserDataToDatabase(facebookId: NSString) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let url = NSURL(string: "http://atleast.aut.bme.hu/ait-ios/messenger/messages")
        let dataTask = urlSession.dataTaskWithURL(url!, completionHandler: {
            data, response, error in
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            print(responseString)
            
            //JSON deserialisation
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
        dataTask.resume()
    }
    static func saveCurrentUserToTheServer() {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        urlSession = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        var userModel = UserModel(user: getCurrentUser(), meeqos: meeqoRepo.getMeeqos(), inventory: itemRepo.getInventory())
        
        println("\(userModel.toJson())")
        
        //let jsonData = NSJSONSerialization.dataWithJSONObject(message, options: nil, error: nil)
        
        let url = NSURL(string: "http://atleast.aut.bme.hu/ait-ios/messenger/add-message")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        /*let postTask = urlSession.uploadTaskWithRequest(request, fromData:
            data, completionHandler: {data, response, error in
                
                if let response = NSJSONSerialization.JSONObjectWithData(data, options:
                    nil, error: nil) as? NSDictionary {
                        
                        let result = response["result"] as! String

                        
                }
                //UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
        
        postTask.resume()*/
    }
    static func updateMeeqoData() {
        let meeqos = meeqoRepo.getMeeqos()
        
        let spentHours = getSpentHours(NSDate())
        for meeqo in meeqos {
            meeqo.sleep = Int(meeqo.sleep) - MeeqoConstans.SLEEP_DECREES_PER_HOUR * spentHours
            meeqo.food = Int(meeqo.food) - MeeqoConstans.FOOD_DECREES_PER_HOUR * spentHours
            meeqo.entertainment = Int(meeqo.entertainment) - MeeqoConstans.PLAY_DECREES_PER_HOUR * spentHours
            if (meeqo.food <= 0 || meeqo.entertainment <= 0 || meeqo.sleep <= 0) {
                meeqoRepo.remove(meeqo)
            }
            meeqo.updateMe()
        }
    }
    private static func getSpentHours(date: NSDate) -> Int {
        let user = userRepo.getUser()
        
        var spentHours = 0
        
        spentHours = Int(date.timeIntervalSinceReferenceDate * 1 / 60) - Int(user.lastUpdatedMeeqos.timeIntervalSinceReferenceDate * 1 / 60)
        println("\(spentHours)")
        if spentHours <= 0 {
            return 0
        }
        if spentHours > 120 {
            return 120
        }
        
        user.lastUpdatedMeeqos = date
        userRepo.updateCurrentUser()
        
        return spentHours
    }
    
    static func getCurrentUser() -> User {
        return userRepo.getUser()
    }
    static func addMoneyToCurrentUser(money: Int) {
        userRepo.getUser().coins = Int(userRepo.getUser().coins) + money
    }
    static func didCompletedChallengeToday() -> Bool {
        let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
        let date = NSDate()
        
        let components = NSCalendar.currentCalendar().components(flags, fromDate: date)
        let components2 = NSCalendar.currentCalendar().components(flags, fromDate: userRepo.getUser().lastDayChallenged)
        
        let year = components.year
        let year2 = components2.year
        println(year)
        println(year2)
        let month = components.month
        let month2 = components2.month
        println(month)
        println(month2)
        let day = components.day
        let day2 = components2.day
        println(day)
        println(day2)
        
        if year == year2 && month == month2 && day == day2 {
            return true
        }
        return false
    }

}