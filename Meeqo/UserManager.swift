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
    static func getCurrentUser() -> User {
        return userRepo.getUser()
    }
    static func addMoneyToCurrentUser(money: Int) {
        userRepo.getUser().coins = Int(userRepo.getUser().coins) + money
    }
}