//
//  ViewController.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "LAExerciseViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "LAExercise.h"
#import "LAResult.h"

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
    
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSArray *myResults = [LAResult getAllResults:context];
    NSLog(@"--> %@", myResults);
}

#pragma mark - TableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _exercises.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExerciseCell" forIndexPath:indexPath];
    LAExercise *exercise = _exercises[indexPath.row];
    cell.textLabel.text = exercise.name;
    return cell;
}

#pragma mark - TableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LAExercise *exercise = _exercises[indexPath.row];
    [self performSegueWithIdentifier:@"StartExercise" sender:exercise];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LAExercise *exercise = (LAExercise *)sender;
    LAExerciseViewController *vc = segue.destinationViewController;
    vc.exercise = exercise;
}






@end
