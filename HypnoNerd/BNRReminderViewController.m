//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by AndyYou on 2014/6/25.
//  Copyright (c) 2014年 AndyYou. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UIButton *clock;
@end
@implementation BNRReminderViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
        UIImage *img = [UIImage imageNamed:@"Time.png"];
        tbi.image = img;
    }
    
    return self;
}
- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder %@", date);
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", @"BNRReminderViewController");
    self.datePicker.date = [[NSDate alloc] initWithTimeInterval:86400 sinceDate:[NSDate date]];
//    self.testButton.titleLabel.text = @"Changed";
//    UIButton *btn = [self.view valueForKey:@"Ch0-2I-zFV"];
//    [btn setTitle:@"Changed" forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
    
}

- (IBAction)setClock:(id)sender
{
    NSLog(@"fake set clock");
    [self.clock setTitle:@"Clicked" forState:UIControlStateNormal];
}
@end
