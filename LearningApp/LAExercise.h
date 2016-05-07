//
//  LAExercise.h
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LAExerciseItem;

@interface LAExercise : NSObject
@property (strong, nonatomic) NSString *exerciseDescription;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray  *items;
@property (strong, nonatomic) LAExerciseItem *currentItem;

+ (LAExercise *)exerciseWithDictionary:(NSDictionary *)dictionary;
- (void)stepForward;
@end
