//
//  LAResult.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "LAResult.h"
#import "LAResultItem.h"

@implementation LAResult

+ (LAResult *)newResult:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"LAResult" inManagedObjectContext:context];
    LAResult *result = [[LAResult alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return result;
}

+ (NSArray *)getAllResults:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"LAResult"];
    NSError *error;
    NSArray *results = [context executeFetchRequest:request error:&error];
    if (error) {
        return nil;
    }
    return results;
}

@end
