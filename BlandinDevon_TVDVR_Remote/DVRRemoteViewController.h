//
//  DVRRemoteViewController.h
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVR.h"
#import "DVRRemote.h"

@interface DVRRemoteViewController : UIViewController <UIActionSheetDelegate>

@property DVR *dvr;
@property DVRRemote *dvrRemote;
@property (weak, nonatomic) IBOutlet UIView *dvrV;
@property (weak, nonatomic) IBOutlet UIView *dvrRemoteV;
@property (weak, nonatomic) IBOutlet UIView *dvrRemoteControlsV;
@property (weak, nonatomic) IBOutlet UILabel *powerL;
@property (weak, nonatomic) IBOutlet UILabel *stateL;
- (IBAction)changePower:(UISwitch *)sender;
- (IBAction)play:(UIButton *)sender;
- (IBAction)stop:(UIButton *)sender;
- (IBAction)pause:(UIButton *)sender;
- (IBAction)FF:(UIButton *)sender;
- (IBAction)RW:(UIButton *)sender;
- (IBAction)record:(UIButton *)sender;

-(void) refreshDVR;
-(void) disableControls;
-(void) enableControls;


@end
