//
//  RPSViewController.m
//  RPSViewControllerPresenter
//
//  Created by Ricardo Pramana Suranta on 04/29/2015.
//  Copyright (c) 2014 Ricardo Pramana Suranta. All rights reserved.
//

#import "RPSViewController.h"

#import <RPSViewControllerPresenter.h>

@interface RPSViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation RPSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setLabelText];
}

- (void)setLabelText
{
    static NSInteger count = 0;

    count++;
    self.label.text = [NSString stringWithFormat:@"This is ViewController number %@.",@(count)];
}

- (IBAction)presentButtonTapped:(id)sender
{
    NSString *className = NSStringFromClass(self.class);
    RPSViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:className];

    [[RPSViewControllerPresenter presenter] presentViewControllerToTop:newViewController
                                                              animated:YES];
}

- (IBAction)dismissButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:^{}];
}

@end
