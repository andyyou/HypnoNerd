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
- (void)loadView {
    BNRHypnosisView *view = [[BNRHypnosisView alloc] init];
    self.view = view;
}
@end
