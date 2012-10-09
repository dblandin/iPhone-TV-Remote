//
//  NavigationViewController.m
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import "NavigationViewController.h"
#import "TVRemoteViewController.h"
#import "DVRRemoteViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController
@synthesize switchB;

@synthesize tvRemoteViewController;
@synthesize dvrRemoteViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tvRemoteViewController = [[TVRemoteViewController alloc] initWithNibName:@"TVRemoteViewController" bundle:nil];
    [self.view insertSubview:self.tvRemoteViewController.view atIndex:0];
}

- (void)viewDidUnload
{
    [self setSwitchB:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)switchViews:(id)sender{
        
    if (self.tvRemoteViewController.view.superview == nil) {
        [UIView beginAnimations:@"View Flip" context:nil];
        [UIView setAnimationDuration:.75];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

        if (self.tvRemoteViewController == nil) {
            self.tvRemoteViewController =
            [[TVRemoteViewController alloc] initWithNibName:@"TVRemoteViewController"
                                                      bundle:nil];
        }
        [UIView setAnimationTransition:
         UIViewAnimationTransitionFlipFromRight
                               forView:self.view cache:YES];
        
        [self.dvrRemoteViewController.view removeFromSuperview];
        [self.view insertSubview:self.tvRemoteViewController.view atIndex:0];
        [UIView commitAnimations];
        
        self.switchB.title = @"DVR Remote";
        
        
    } else {
        [UIView beginAnimations:@"View Flip" context:nil];
        [UIView setAnimationDuration:.75];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

        
        if (self.dvrRemoteViewController == nil) {
            self.dvrRemoteViewController =
            [[DVRRemoteViewController alloc] initWithNibName:@"DVRRemoteViewController"
                                                    bundle:nil];
        }
        [UIView setAnimationTransition:
         UIViewAnimationTransitionFlipFromLeft
                               forView:self.view cache:YES];
        
        [self.tvRemoteViewController.view removeFromSuperview];
        [self.view insertSubview:self.dvrRemoteViewController.view atIndex:0];
        [UIView commitAnimations];
        self.switchB.title = @"TV Remote";
        
    
    
    }
    
}


@end
