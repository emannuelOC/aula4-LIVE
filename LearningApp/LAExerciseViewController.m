//
//  LAExerciseViewController.m
//  LearningApp
//
//  Created by Emannuel Carvalho on 5/7/16.
//  Copyright © 2016 Emannuel Carvalho. All rights reserved.
//

#import "LAExerciseViewController.h"

@interface LAExerciseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *option1Button;
@property (weak, nonatomic) IBOutlet UIButton *option2Button;
@property (weak, nonatomic) IBOutlet UIButton *option3Button;
@property (weak, nonatomic) IBOutlet UIButton *option4Button;

@end

@implementation LAExerciseViewController

- (IBAction)evaluateAnswer:(UIButton *)sender {
    // check answer at sender.titleLabel.text
}


@end
