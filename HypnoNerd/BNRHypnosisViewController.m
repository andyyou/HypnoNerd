//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by AndyYou on 2014/6/25.
//  Copyright (c) 2014年 AndyYou. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
@interface BNRHypnosisViewController() <UITextFieldDelegate>
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
    segment.frame = CGRectMake(40, 30, 240, 38);
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [_hypnosisView addSubview:segment];
    
    CGRect  textFieldRect = CGRectMake(40, 80, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Default";
    textField.returnKeyType = UIReturnKeyDone;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = NO;
    textField.enablesReturnKeyAutomatically = YES;
    textField.keyboardType = UIKeyboardTypeURL;
    textField.secureTextEntry = NO;
    textField.delegate = self;
    [_hypnosisView addSubview:textField];
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i=0; i<20; i++)
    {
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        [messageLabel sizeToFit];
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        int height = (self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
    }
}
@end
