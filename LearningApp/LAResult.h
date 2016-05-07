//
//  LAResult.h
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LAResultItem;

NS_ASSUME_NONNULL_BEGIN

@interface LAResult : NSManagedObject

+ (LAResult *)newResult:(NSManagedObjectContext *)context;
+ (NSArray *)getAllResults:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "LAResult+CoreDataProperties.h"
