//
//  MeeqoManager.swift
//  Meeqo
//
//  Created by Livvit on 01/05/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation


class MeeqoManager {
    
    static func getMeeqoIcons() -> [UIImage]{
        var images = [UIImage(named: "narancs")!,UIImage(named: "lila")!,UIImage(named: "rozsaszin")! ,UIImage(named: "zold")!, UIImage(named: "kek")!,UIImage(named: "fekete")!,UIImage(named: "piros")! ,UIImage(named: "szivarvany")!]
        return images
    }
    
    static func getMeeqoColorName() -> [String] {
        var colors = ["narancs","lila","rozsaszin","zold","kek","fekete","piros","szivarvany"]
        return colors
    }
    
    static func getMeeqoTitles() -> [String] {
        var colors = ["Orange","Purple","Pink","Green","Blue","Black","Red","Rainbow"]
        return colors
        
    }
    
    static func buyMeeqo(color: NSString) {
        switch color {
            case "":
                
                break
        default:
                break
        }
    }
}