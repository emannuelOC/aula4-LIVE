//
//  LAExercise.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "LAExercise.h"
#import "LAExerciseItem.h"

@implementation LAExercise

- (LAExercise *)initWithName:(NSString *)name exerciseDescription:(NSString *)description andItems:(NSArray *)items {
    self = [super init];
    if (!self) {
        return nil;
    }
    _name = name;
    _exerciseDescription = description;
    _items = items;
    return self;
}

+ (LAExercise *)exerciseWithDictionary:(NSDictionary *)dictionary {
    NSString *name        = dictionary[@"name"];
    NSString *description = dictionary[@"description"];
    NSArray  *items       = dictionary[@"questions"];
    
    // 1: inicializar mutable array para os itens
    NSMutableArray *newItems = [[NSMutableArray alloc] init];
    
    // 2: iterar pelos dicionarios de itens
    for (NSDictionary *itemDictionary in items) {
    
        // 3: criar um ExerciseItem a partir do dicionario
        LAExerciseItem *exerciseItem = [LAExerciseItem itemWithDictionary:itemDictionary];
        
        // 4: se nao for nulo, acrescentar no array
        if (exerciseItem) {
            [newItems addObject:exerciseItem];
        }
    }
    
    if (!name || !description) {
        return nil;
    }
    return [[LAExercise alloc] initWithName:name
                        exerciseDescription:description
                                   andItems:newItems];
}

@end
