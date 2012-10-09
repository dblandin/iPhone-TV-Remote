//
//  DVRRemoteViewController.m
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import "DVRRemoteViewController.h"

@implementation DVRRemoteViewController

@synthesize dvr;
@synthesize dvrRemote;
@synthesize dvrV;
@synthesize dvrRemoteV;
@synthesize dvrRemoteControlsV;
@synthesize powerL;
@synthesize stateL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        dvr = [[DVR alloc] init];
        dvrRemote = [[DVRRemote alloc] initRemoteFor:dvr];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self disableControls];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setPowerL:nil];
    [self setDvrV:nil];
    [self setDvrRemoteV:nil];
    [self setDvrRemoteControlsV:nil];
    [self setStateL:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changePower:(UISwitch *)sender {
    if (sender.on == TRUE)
    {
        [dvrRemote powerOn];
        [self enableControls];
    }
    else
    {
        [dvrRemote powerOff];
        [self disableControls];
    }
    [self refreshDVR];
}

- (IBAction)play:(UIButton *)sender {
    if ([dvr.state isEqualToString:@"recording"])
    {
        
        NSString *message = [[NSString alloc] initWithFormat:@"Status is %@. Force play?", dvr.state];
        UIActionSheet *action = [[UIActionSheet alloc]
                                 initWithTitle:message
                                 delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 destructiveButtonTitle:@"Force Play"
                                 otherButtonTitles:nil, nil];
        
        [action showInView:self.view];
    }
    else
    {
        [dvrRemote play];
        [self refreshDVR];
    }
    
}

- (IBAction)stop:(UIButton *)sender {
    [dvrRemote stop];
    [self refreshDVR];
}

- (IBAction)pause:(UIButton *)sender {
    if ([dvr.state isEqualToString:@"playing"])
    {
        [dvrRemote pause];
        [self refreshDVR];
    }
    else
    {
        NSString *message = [[NSString alloc] initWithFormat:@"Status is %@. Force pause?", dvr.state];
        UIActionSheet *action = [[UIActionSheet alloc]
                                 initWithTitle:message
                                 delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 destructiveButtonTitle:@"Force Pause"
                                 otherButtonTitles:nil, nil];
        
        [action showInView:self.view];
    }
}

- (IBAction)FF:(UIButton *)sender {
    if ([dvr.state isEqualToString:@"playing"])
    {
        [dvrRemote FF];
        [self refreshDVR];
    }
    else
    {
        NSString *message = [[NSString alloc] initWithFormat:@"Status is %@. Force Fast Forward?", dvr.state];
        UIActionSheet *action = [[UIActionSheet alloc]
                                 initWithTitle:message
                                 delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 destructiveButtonTitle:@"Force Fast Forward"
                                 otherButtonTitles:nil, nil];
        
        [action showInView:self.view];
    }
}

- (IBAction)RW:(UIButton *)sender {
    if ([dvr.state isEqualToString:@"playing"])
    {
        [dvrRemote RW];
        [self refreshDVR];
    }
    else
    {
        NSString *message = [[NSString alloc] initWithFormat:@"Status is %@. Force rewind?", dvr.state];
        UIActionSheet *action = [[UIActionSheet alloc]
                                 initWithTitle:message
                                 delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 destructiveButtonTitle:@"Force Rewind"
                                 otherButtonTitles:nil, nil];
        
        [action showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger) buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *option = [actionSheet buttonTitleAtIndex:buttonIndex];
        if ([option isEqualToString:@"Force Rewind"])
        {
            [dvrRemote RW];
            [self refreshDVR];
        } else if ([option isEqualToString:@"Force Fast Forward"])
        {
            [dvrRemote FF];
            [self refreshDVR];
        } else if ([option isEqualToString:@"Force Play"])
        {
            [dvrRemote play];
            [self refreshDVR];
        } else if ([option isEqualToString:@"Force Pause"])
        {
            [dvrRemote pause];
            [self refreshDVR];
        } else if ([option isEqualToString:@"Force Stop"])
        {
            [dvrRemote stop];
            [self refreshDVR];
        } else  // if ([option isEqualToString:@"Force Record"])
        {
            [dvrRemote record];
            [self refreshDVR];
        }
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Alert"
                              message:@"Operation Forced!"
                              delegate:self
                              cancelButtonTitle:@"Dismiss"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)record:(UIButton *)sender {
    if ([dvr.state isEqualToString:@"stopped"])
    {
        [dvrRemote record];
        [self refreshDVR];
    }
    else
    {
        NSString *message = [[NSString alloc] initWithFormat:@"Status is %@. Force record?", dvr.state];
        UIActionSheet *action = [[UIActionSheet alloc]
                                 initWithTitle:message
                                 delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 destructiveButtonTitle:@"Force Record"
                                 otherButtonTitles:nil, nil];
        
        [action showInView:self.view];
    }
}

-(void) refreshDVR
{
    if (dvr.power == 1)
    {
        powerL.text = @"On";
    }
    else
    {
        powerL.text = @"Off";
    }
    stateL.text = [dvr state];
}

-(void) disableControls
{
    for (UIView *view in dvrRemoteControlsV.subviews) {
        view.userInteractionEnabled = FALSE;
        view.alpha = 0.5;
    }
}

-(void) enableControls
{
    for (UIView *view in dvrRemoteControlsV.subviews) {
        view.userInteractionEnabled = TRUE;
        view.alpha = 1.0;
    }
}

@end