//
//  LAResultItem.h
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "LAResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface LAResultItem : NSManagedObject

+ (NSArray *)getAllResultItemsForResult:(LAResult *)result atContext:(NSManagedObjectContext *)context;
+ (LAResultItem *)newResultItem:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "LAResultItem+CoreDataProperties.h"
