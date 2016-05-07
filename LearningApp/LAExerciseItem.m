//
//  LAExerciseItem.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "LAExerciseItem.h"

@implementation LAExerciseItem

- (LAExerciseItem *)initWithQuestion:(NSString *)question alternatives:(NSArray *)alternatives andRightAnswer:(NSString *)rightAnswer {
    self = [super init];
    if (!self) {
        return nil;
    }
    _question     = question;
    _alternatives = alternatives;
    _rightAnswer  = rightAnswer;
    return self;
}

+ (LAExerciseItem *)itemWithDictionary:(NSDictionary *)dictionary {
    NSString *question    = dictionary[@"question"];
    NSArray *alternatives = dictionary[@"alternatives"];
    NSString *rightAnswer = dictionary[@"rightAnswer"];
    return [[LAExerciseItem alloc] initWithQuestion:question alternatives:alternatives andRightAnswer:rightAnswer];
}



@end
