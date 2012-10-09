//
//  Television.h
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Television : NSObject
{
    int channel;
    int volume;
    CFTimeInterval lastChannelPress;
}

@property int power;

-(void) powerOn;
-(void) powerOff;
-(int) channel;
-(int) setChannel:(int) channelIn;
-(int) channelUp;
-(int) channelDown;
-(int) volumeUp;
-(int) volumeDown;
-(int) volume;
-(int) setVolume:(int) volumeIn;

@end
