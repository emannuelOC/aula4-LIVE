//
//  LAResultItem.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "LAResult.h"
#import "LAResultItem.h"

@implementation LAResultItem

+ (LAResultItem *)newResultItem:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"LAResultItem" inManagedObjectContext:context];
    LAResultItem *item = [[LAResultItem alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return item;
}

+ (NSArray *)getAllResultItemsForResult:(LAResult *)result atContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"LAResultItem"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"result = %@", result];
    request.predicate = predicate;
    NSError *error;
    NSArray *items = [context executeFetchRequest:request error:&error];
    if (error) {
        return nil;
    }
    return items;
}









@end
