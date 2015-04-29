//
//  RPSViewControllerPresenterSpec.m
//  RPSViewControllerPresenter
//
//  Created by Ricardo Pramana Suranta on 4/29/15.
//  Copyright (c) 2015 Ricardo Pramana Suranta. All rights reserved.
//

#import "RPSViewControllerPresenter.h"
#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>

SpecBegin(RPSViewControllerPresenter)

__block RPSViewControllerPresenter *presenter;

__block UIViewController *firstViewController;
__block UIViewController *secondViewController;
__block UIViewController *thirdViewController;

before(^{
    
    firstViewController = OCMPartialMock([UIViewController new]);
    secondViewController = OCMPartialMock([UIViewController new]);
    thirdViewController = OCMPartialMock([UIViewController new]);
    
    OCMStub([firstViewController presentedViewController]).andReturn(secondViewController);
    OCMStub([secondViewController presentedViewController]).andReturn(thirdViewController);
    
    presenter = [[RPSViewControllerPresenter alloc] initWithRootViewController:firstViewController];
});

describe(@"presentViewControllerToTop:", ^{
    
    __block UIViewController *viewController;
    
    __block void (^thirdViewControllerPresentCompletionBlock)();
    __block void (^thirdViewControllerStubBlock) (NSInvocation *invocation) = ^(NSInvocation *invocation){
        [invocation retainArguments];
        [invocation getArgument:&thirdViewControllerPresentCompletionBlock
                        atIndex:4];
    };
    
    before(^{
        viewController = [UIViewController new];
        
        OCMStub([thirdViewController presentViewController:[OCMArg any]
                                                  animated:YES
                                                completion:[OCMArg any]])
        .andDo(thirdViewControllerStubBlock);
        
        OCMStub([thirdViewController presentViewController:[OCMArg any]
                                                  animated:NO
                                                completion:[OCMArg any]])
        .andDo(thirdViewControllerStubBlock);
        
    });
    
    it(@"should present the passed view controller to the top most presented view controller", ^{
        [presenter presentViewControllerToTop:viewController
                                     animated:YES];
        
        OCMVerify([[(id)thirdViewController ignoringNonObjectArgs] presentViewController:viewController
                                                                                animated:YES
                                                                              completion:[OCMArg checkWithBlock:^BOOL(id obj) {
            return YES;
        }]]);
    });
    
    it(@"should send next: event on returned RACSignal when presentViewController: completed", ^{

        __block BOOL nextReceived = NO;
        
        [[presenter presentViewControllerToTop:viewController
                                     animated:YES]
         subscribeNext:^(id x) {
            nextReceived = YES;
        }];
        
        thirdViewControllerPresentCompletionBlock();
        
        expect(nextReceived).to.beTruthy();
    });
    
    context(@"with animation", ^{
        
        before(^{
            [presenter presentViewControllerToTop:viewController
                                         animated:YES];
        });
        
        it(@"should pass YES to top view controller's present method", ^{
            
            OCMVerify([thirdViewController presentViewController:[OCMArg any]
                                                        animated:YES
                                                      completion:[OCMArg checkWithBlock:^BOOL(id obj) {
                return YES;
            }]]);
        });
    });
    
    context(@"without animation", ^{
        
        before(^{
            [presenter presentViewControllerToTop:viewController
                                         animated:NO];
        });
        
        it(@"should pass YES to top view controller's present method", ^{
            
            OCMVerify([thirdViewController presentViewController:[OCMArg any]
                                                        animated:NO
                                                      completion:[OCMArg checkWithBlock:^BOOL(id obj) {
                return YES;
            }]]);
        });
    });
    
    
});


SpecEnd