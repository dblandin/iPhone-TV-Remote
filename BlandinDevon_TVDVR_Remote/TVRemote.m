//
//  TVRemote.m
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import "TVRemote.h"

@implementation TVRemote

@synthesize television;

-(id) initRemoteFor:(Television *) televisionIn;
{
    self = [super init];
    if (self) {
        [self setTelevision:televisionIn];
    }
    return self;
}

-(void) setChannel:(int)channel
{
    [self.television setChannel:channel];
}

-(int) channelUp
{
    return [television channelUp];
}

-(int) channelDown
{
    return [television channelDown];
}

-(int) volumeUp
{
    return [television volumeUp];
}

-(int) volumeDown
{
    return [television volumeDown];
}

-(void) setVolume:(int)volume
{
    [self.television setVolume:volume];
}

-(void) powerOn
{
    [self.television powerOn];
}

-(void) powerOff
{
    [self.television powerOff];
}
-(int) favoriteChannel
{
    return favoriteChannel;
}
-(void) setFavoriteChannel:(int)channel
{
    if (channel >= 1 && channel <= 99) {
        favoriteChannel = channel;
    }
}

@end