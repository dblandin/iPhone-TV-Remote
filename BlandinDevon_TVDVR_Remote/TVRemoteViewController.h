//
//  TVRemoteViewController.h
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Television.h"
#import "TVRemote.h"

@interface TVRemoteViewController : UIViewController

@property Television *television;
@property TVRemote *tvRemote;

@property (weak, nonatomic) IBOutlet UIView *televisionV;
@property (weak, nonatomic) IBOutlet UILabel *powerL;
@property (weak, nonatomic) IBOutlet UILabel *channelL;
@property (weak, nonatomic) IBOutlet UILabel *volumeL;

@property (weak, nonatomic) IBOutlet UIView *remoteV;
@property (weak, nonatomic) IBOutlet UIView *remoteControlsV;


- (IBAction)changePower:(UISwitch *)sender;
- (IBAction)channelUp;
- (IBAction)channelDown;
- (IBAction)changeChannel:(UIButton *)sender;
- (IBAction)volumeUp:(UIButton *)sender;
- (IBAction)volumeDown:(UIButton *)sender;
- (IBAction)changeVolume:(UISlider *)sender;
- (IBAction)changeFavoriteChannel:(UISegmentedControl *)sender;

-(void) refreshTelevision;
-(void) disableControls;
-(void) enableControls;

@end
