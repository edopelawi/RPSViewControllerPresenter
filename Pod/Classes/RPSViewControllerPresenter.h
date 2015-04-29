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

/**
 *  Presents view controller as top presented view controller on current view controller
 *
 *
 *  @param viewController @p UIViewController instance.
 *  @param animated       Whether it should be presented with animation or not.
 *
 *  @return @p RACSignal instance that sends @p next: event if the presentation completed.
 */
- (RACSignal *)presentViewControllerToTop:(UIViewController *)viewController
                                 animated:(BOOL)animated;

@end
