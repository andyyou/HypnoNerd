//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by AndyYou on 2014/6/25.
//  Copyright (c) 2014年 AndyYou. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *img = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = img;
    }
    return self;
}


- (void)loadView
{
    BNRHypnosisView *view = [[BNRHypnosisView alloc] init];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", @"BNRHypnosisViewController");
}

@end
