//
//  TVRemoteViewController.m
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import "TVRemoteViewController.h"

@implementation TVRemoteViewController

@synthesize television;
@synthesize tvRemote;
@synthesize remoteV;
@synthesize televisionV;
@synthesize remoteControlsV;
@synthesize powerL;
@synthesize channelL;
@synthesize volumeL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        television = [[Television alloc] init];
        tvRemote = [[TVRemote alloc] initRemoteFor:television];
    }
    return self;
}

- (void)viewDidLoad
{
    [self disableControls];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    television = [[Television alloc] init];
    tvRemote = [[TVRemote alloc] initRemoteFor:television];
}

- (void)viewDidUnload
{
    [self setPowerL:nil];
    [self setChannelL:nil];
    [self setVolumeL:nil];
    [self setRemoteV:nil];
    [self setTelevisionV:nil];
    [self setRemoteControlsV:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changePower:(UISwitch *)sender
{
    if (sender.on == TRUE)
    {
        [tvRemote powerOn];
        [self enableControls];
    }
    else
    {
        [tvRemote powerOff];
        [self disableControls];
    }
    [self refreshTelevision];
}
-(void) refreshTelevision
{
    if (television.power == 1)
    {
        powerL.text = @"On";
    }
    else
    {
        powerL.text = @"Off";
    }
    channelL.text = [NSString stringWithFormat:@"%d", television.channel];
    volumeL.text = [NSString stringWithFormat:@"%d", television.volume];
}

-(void) enableControls
{
    for (UIView *view in remoteControlsV.subviews) {
        view.userInteractionEnabled = TRUE;
        view.alpha = 1.0;
    }
}

- (IBAction)changeChannel:(UIButton *)sender {
    [tvRemote setChannel:[sender.titleLabel.text intValue]];
    [self refreshTelevision];
}

- (IBAction)volumeUp:(UIButton *)sender {
    [tvRemote volumeUp];
    [self refreshTelevision];
}

- (IBAction)volumeDown:(UIButton *)sender {
    [tvRemote volumeDown];
    [self refreshTelevision];
}

-(void) disableControls
{
    for (UIView *view in remoteControlsV.subviews) {
        view.userInteractionEnabled = FALSE;
        view.alpha = 0.5;
    }
}

- (IBAction)channelUp
{
    [tvRemote channelUp];
    [self refreshTelevision];
}

- (IBAction)channelDown
{
    [tvRemote channelDown];
    [self refreshTelevision];
}

- (IBAction)changeVolume:(UISlider *)sender {
    [tvRemote setVolume:(int)sender.value];
    [self refreshTelevision];
}

- (IBAction)changeFavoriteChannel:(UISegmentedControl *)sender {
    NSString *channel = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
    if ([channel isEqualToString:@"NBC"])
    {
        [tvRemote setFavoriteChannel:04];
    }
    else if ([channel isEqualToString:@"ABC"])
    {
        [tvRemote setFavoriteChannel:07];
    }
    else if ([channel isEqualToString:@"CBS"])
    {
        [tvRemote setFavoriteChannel:9];
    }
    else if ([channel isEqualToString:@"FOX"])
    {
        [tvRemote setFavoriteChannel:5];
    }
    NSLog(@"%d", tvRemote.favoriteChannel);
}

@end
