//
//  Meeqo.h
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MeeqoPosition;

@interface Meeqo : NSManagedObject

@property (nonatomic, retain) NSNumber * food;
@property (nonatomic, retain) NSNumber * entertainment;
@property (nonatomic, retain) NSNumber * sleep;
@property (nonatomic, retain) MeeqoPosition *position;

@end
