//
//  ViewController.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "ViewController.h"
#import "LAExercise.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *exercisesTableView;
@property (strong, nonatomic) NSArray *exercises;
@end

@implementation ViewController

#pragma mark - ViewController life cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSURL *url = [NSURL URLWithString:@"https://lana.mybluemix.net/api/exercises"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"ERROR: %@", error.description);
        } else {
            NSError *localError;
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
            NSArray *exercisesDict = results[@"results"];
            NSMutableArray *exercisesTemp = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in exercisesDict) {
                LAExercise *exercise = [LAExercise exerciseWithDictionary:dict];
                if (exercise) {
                    [exercisesTemp addObject:exercise];
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.exercises = exercisesTemp;
                [self.exercisesTableView reloadData];
            });
        }
    }];
    [task resume];
}

#pragma mark - TableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _exercises.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     1. criar a cell (dequeueReusable...)
     2. configurar (cell.textLabel...)
     3. retornar a cell
    */
    
    // 1
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExerciseCell" forIndexPath:indexPath];
    // 2
    LAExercise *exercise = _exercises[indexPath.row];
    cell.textLabel.text = exercise.name;
    //3
    return cell;
}

#pragma mark - TableView delegate

/*
 
 1. quantas sections
 2. quantas linhas
 3. a célula pra linha x
 
*/







@end
