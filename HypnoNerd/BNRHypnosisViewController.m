//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by AndyYou on 2014/6/25.
//  Copyright (c) 2014年 AndyYou. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
@interface BNRHypnosisViewController()
@property (strong, nonatomic) BNRHypnosisView *hypnosisView;
@end
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
    _hypnosisView = [[BNRHypnosisView alloc] init];
    NSArray *options = @[@"Red", @"Green", @"Blue"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:options];
    segment.frame = CGRectMake(50, 30, 200, 38);
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [_hypnosisView addSubview:segment];
    self.view = _hypnosisView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", @"BNRHypnosisViewController");
}

- (void)segmentAction:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0: {
            NSLog(@"Red");
            [_hypnosisView setCircleColor:[UIColor redColor]];
            
        }
            break;
        case 1: {
            NSLog(@"Green");
            [_hypnosisView setCircleColor:[UIColor greenColor]];
        }
            break;
        case 2: {
            NSLog(@"Blue");
            [_hypnosisView setCircleColor:[UIColor blueColor]];
        }
            break;
        default:
            break;
    }
    
}

@end
