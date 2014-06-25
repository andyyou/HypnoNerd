//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by AndyYou on 2014/6/17.
//  Copyright (c) 2014年 AndyYou. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()
@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController
#pragma mark ** Inherit
- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    // TODO: adsf
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"From what is cognac made ?",
                           @"What is 7 + 7 ?",
                           @"What is the captial of Vermont ?"
                           ];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"
                         ];
        self.tabBarItem.title = @"Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"Exam.png"];
    }
    return self;
    
}

#pragma mark ** IBAction
- (IBAction)showQuestion: (id)sender {
    // FIXME: asdf
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer: (id)sender {
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
}
@end
