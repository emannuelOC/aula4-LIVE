//
//  LAExercise.h
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAExercise : NSObject
@property (strong, nonatomic) NSString *exerciseDescription;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray  *items;

+ (LAExercise *)exerciseWithDictionary:(NSDictionary *)dictionary;
@end
