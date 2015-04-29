//
//  RPSViewControllerPresenter.h
//  RPSViewControllerPresenter
//
//  Created by Ricardo Pramana Suranta on 4/29/15.
//  Copyright (c) 2015 Ricardo Pramana Suranta. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;
@class RACSignal;

@interface RPSViewControllerPresenter : NSObject

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

- (RACSignal *)presentViewControllerToTop:(UIViewController *)viewController
                                 animated:(BOOL)animated;

@end
