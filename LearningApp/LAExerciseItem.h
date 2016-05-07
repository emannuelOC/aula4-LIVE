//
//  LAExerciseItem.h
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAExerciseItem : NSObject
@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSArray  *alternatives;
@property (strong, nonatomic) NSString *rightAnswer;

+ (LAExerciseItem *)itemWithDictionary:(NSDictionary *)dictionary;
@end
