//
//  LAResult+CoreDataProperties.h
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LAResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface LAResult (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *startDate;
@property (nullable, nonatomic, retain) NSDate *finishDate;
@property (nullable, nonatomic, retain) NSNumber *generalResult;
@property (nullable, nonatomic, retain) NSString *exerciseName;
@property (nullable, nonatomic, retain) NSSet<LAResultItem *> *resultItems;

@end

@interface LAResult (CoreDataGeneratedAccessors)

- (void)addResultItemsObject:(LAResultItem *)value;
- (void)removeResultItemsObject:(LAResultItem *)value;
- (void)addResultItems:(NSSet<LAResultItem *> *)values;
- (void)removeResultItems:(NSSet<LAResultItem *> *)values;

@end

NS_ASSUME_NONNULL_END
