//
//  LAExerciseViewController.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "LAExerciseViewController.h"
#import "LAExerciseItem.h"
#import "LAResultItem.h"
#import "AppDelegate.h"
#import "LAExercise.h"
#import "LAResult.h"

@interface LAExerciseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *option1Button;
@property (weak, nonatomic) IBOutlet UIButton *option2Button;
@property (weak, nonatomic) IBOutlet UIButton *option3Button;
@property (weak, nonatomic) IBOutlet UIButton *option4Button;
/***/
@property (strong, nonatomic) LAResult *result;
@property (strong, nonatomic) NSManagedObjectContext *context;
@end

@implementation LAExerciseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateItem:nil];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _context = appDelegate.managedObjectContext;
    _result = [LAResult newResult:_context];
    _result.startDate = [NSDate date];
    _result.exerciseName = _exercise.name;
    _result.generalResult = [NSNumber numberWithFloat:0.0];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateItem:) name:@"LADidChangeItem" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishExercise) name:@"LAExerciseIsOutOfItems" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)evaluateAnswer:(UIButton *)sender {
    LAResultItem *item = [LAResultItem newResultItem:_context];
    item.givenAnswer = sender.titleLabel.text;
    item.rightAnswer = _exercise.currentItem.rightAnswer;
    UIColor *evaluationColor;
    if ([sender.titleLabel.text isEqualToString:_exercise.currentItem.rightAnswer]) {
        evaluationColor = [UIColor greenColor];
        item.evaluation = [NSNumber numberWithBool:YES];
        float resultFloat = _result.generalResult.floatValue + 1.0 / _exercise.items.count;
        _result.generalResult = [NSNumber numberWithFloat:resultFloat];
    } else {
        evaluationColor = [UIColor redColor];
        item.evaluation = [NSNumber numberWithBool:NO];
    }
    sender.backgroundColor = evaluationColor;
    [UIView animateWithDuration:0.4 animations:^{
        _questionLabel.transform = CGAffineTransformMakeTranslation(-400, 0);
    } completion:^(BOOL finished) {
        sender.backgroundColor = [UIColor whiteColor];
        _questionLabel.transform = CGAffineTransformMakeTranslation(400, 0);
        [_exercise stepForward];
    }];
}

#pragma mark - Utility methods

- (void)updateItem:(NSNotification *)notification {
    LAExerciseItem *item = _exercise.currentItem;
    _questionLabel.text = item.question;
    NSArray *alternatives = item.alternatives;
    [UIView animateWithDuration:0.4 animations:^{
        self.questionLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
    if (alternatives.count == 4) {
        [_option1Button setTitle:alternatives[0] forState:UIControlStateNormal];
        [_option2Button setTitle:alternatives[1] forState:UIControlStateNormal];
        [_option3Button setTitle:alternatives[2] forState:UIControlStateNormal];
        [_option4Button setTitle:alternatives[3] forState:UIControlStateNormal];
    }
    
    // animation
}

- (void)finishExercise {
    _result.finishDate = [NSDate date];
    [_context save:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
