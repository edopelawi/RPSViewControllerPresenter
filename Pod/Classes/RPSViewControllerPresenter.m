//
//  RPSViewControllerPresenter.m
//  RPSViewControllerPresenter
//
//  Created by Ricardo Pramana Suranta on 4/29/15.
//  Copyright (c) 2015 Ricardo Pramana Suranta. All rights reserved.
//

#import "RPSViewControllerPresenter.h"

#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>

@interface RPSViewControllerPresenter ()

@property (nonatomic, strong) UIViewController *rootViewController;

@end

@implementation RPSViewControllerPresenter

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    
    if (self) {
        _rootViewController = rootViewController;
    }
    
    return self;
}

- (RACSignal *)presentViewControllerToTop:(UIViewController *)viewController
                                 animated:(BOOL)animated;
{
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    UIViewController *topViewController = self.rootViewController;
    
    while (nil != topViewController.presentedViewController) {
        topViewController = topViewController.presentedViewController;
    }
    
    [topViewController presentViewController:viewController
                                    animated:animated
                                  completion:^{
                                      [subject sendNext:@YES];
                                  }];
    
    return subject;
}

@end
