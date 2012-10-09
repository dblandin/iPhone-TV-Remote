//
//  NavigationViewController.h
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TVRemoteViewController;
@class DVRRemoteViewController;

@interface NavigationViewController : UIViewController

@property (strong, nonatomic) TVRemoteViewController *tvRemoteViewController;
@property (strong, nonatomic) DVRRemoteViewController *dvrRemoteViewController;

-(IBAction)switchViews:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *switchB;

@end
