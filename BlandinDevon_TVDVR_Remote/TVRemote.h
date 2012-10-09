//
//  TVRemote.h
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Television.h"

@interface TVRemote : NSObject
{
    int favoriteChannel;
}

@property Television *television;
-(id) initRemoteFor:(Television *) televisionIn;
-(void) setChannel:(int) channel;
-(int) channelUp;
-(int) channelDown;
-(int) volumeUp;
-(int) volumeDown;
-(void) setVolume:(int) volume;
-(void) powerOn;
-(void) powerOff;
-(int) favoriteChannel;
-(void) setFavoriteChannel:(int) channel;

@end
